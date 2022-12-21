package br.edu.utfpr.tdsapi.repository.tarefa;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import br.edu.utfpr.tdsapi.model.Tarefa;
import br.edu.utfpr.tdsapi.repository.filter.TarefaFilter;

public interface TarefaRepositoryQuery {
	
	public Page<Tarefa> filtrar(TarefaFilter tarefaFilter, Pageable pageable);

}
