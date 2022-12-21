package br.edu.utfpr.tdsapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import br.edu.utfpr.tdsapi.model.Tarefa;
import br.edu.utfpr.tdsapi.repository.tarefa.TarefaRepositoryQuery;


	public interface TarefaRepository extends JpaRepository<Tarefa, Long>, TarefaRepositoryQuery {
	 
	}
