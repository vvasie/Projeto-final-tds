package br.edu.utfpr.tdsapi.repository.tarefa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.Predicate;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.util.StringUtils;
import br.edu.utfpr.tdsapi.model.Tarefa;
import br.edu.utfpr.tdsapi.repository.filter.TarefaFilter;

public class TarefaRepositoryImpl implements TarefaRepositoryQuery {
	
	@PersistenceContext
	private EntityManager manager;

	@Override
	public Page<Tarefa> filtrar(TarefaFilter tarefaFilter, Pageable pageable) {
		
		CriteriaBuilder builder = this.manager.getCriteriaBuilder();
		CriteriaQuery<Tarefa> criteria = builder.createQuery(Tarefa.class);
		Root<Tarefa> root = criteria.from(Tarefa.class);
						
		Predicate[] predicates = criarRestricoes(tarefaFilter, builder, root);
		criteria.where(predicates);
		
		TypedQuery<Tarefa> query = manager.createQuery(criteria);
		
		adicionarRestricoesDePaginacao(query, pageable);
		
		return new PageImpl<>(query.getResultList(), pageable, total(tarefaFilter));
	}
	
	private Predicate[] criarRestricoes(TarefaFilter tarefaFilter, CriteriaBuilder builder, Root<Tarefa> root) {	
		List<Predicate> predicates = new ArrayList<>();
		
		if (!StringUtils.isEmpty(tarefaFilter.getDescricao())) {
			predicates.add(builder.like(
					builder.lower(root.get("descricao")), "%" + tarefaFilter.getDescricao().toLowerCase() + "%")); // MetaModel removido
		}
		
		if (tarefaFilter.getDataInicio() != null) {
			predicates.add(
					builder.greaterThanOrEqualTo(root.get("dataInicio"), tarefaFilter.getDataInicio())); // MetaModel removido
		}
		
		if (tarefaFilter.getDataFim() != null) {
			predicates.add(
					builder.lessThanOrEqualTo(root.get("dataFim"), tarefaFilter.getDataFim())); // MetaModel removido
		}
		
		return predicates.toArray(new Predicate[predicates.size()]);
	}
	

	private Long total(TarefaFilter tarefaFilter) {
		CriteriaBuilder builder = manager.getCriteriaBuilder();
		CriteriaQuery<Long> criteria = builder.createQuery(Long.class);
		Root<Tarefa> root = criteria.from(Tarefa.class);
			
		Predicate[] predicates = criarRestricoes(tarefaFilter, builder, root);
		criteria.where(predicates);
			
		criteria.select(builder.count(root));
			
		return manager.createQuery(criteria).getSingleResult();
	}
	
	private void adicionarRestricoesDePaginacao(TypedQuery<Tarefa> query, Pageable pageable) {
		int paginaAtual = pageable.getPageNumber();
		int totalRegistrosPorPagina = pageable.getPageSize();
		int primeiroRegistroDaPagina = paginaAtual * totalRegistrosPorPagina;
			
		query.setFirstResult(primeiroRegistroDaPagina);
		query.setMaxResults(totalRegistrosPorPagina);
		}
		
	}

