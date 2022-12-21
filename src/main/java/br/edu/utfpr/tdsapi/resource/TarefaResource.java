package br.edu.utfpr.tdsapi.resource;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.edu.utfpr.tdsapi.event.RecursoCriadoEvent;
import br.edu.utfpr.tdsapi.model.Tarefa;
import br.edu.utfpr.tdsapi.repository.TarefaRepository;

@RestController
@RequestMapping("/tarefas")
public class TarefaResource {
	
	@Autowired
	private TarefaRepository tarefaRepository;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
	/*@CrossOrigin(origins = {"http://localhost:8000"})    //cors
	*/
	@GetMapping
	@PreAuthorize("hasAuthority('PESQUISAR_TAREFA') and #oauth2.hasScope('read')")
	public ResponseEntity<?> listar() {
		List<Tarefa> tarefas = this.tarefaRepository.findAll();
		return !tarefas.isEmpty() ? ResponseEntity.ok(tarefas) : ResponseEntity.noContent().build();
	}
	/*
	@GetMapping
	public  Page<Tarefa> pesquisar(TarefaFilter tarefaFilter, Pageable pageable){
		return tarefaRepository.filtrar(tarefaFilter, pageable);
	}
*/		
	@PostMapping
	@PreAuthorize("hasAuthority('CADASTRAR_TAREFA') and #oauth2.hasScope('write')")
	public ResponseEntity<Tarefa> criar(@Valid @RequestBody Tarefa tarefa, HttpServletResponse response) {
		Tarefa tarefaSalva = tarefaRepository.save(tarefa);
		
		publisher.publishEvent(new RecursoCriadoEvent(this, response, tarefaSalva.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(tarefaSalva);
	}
	
	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('PESQUISAR_TAREFA') and #oauth2.hasScope('read')")
	public ResponseEntity<?> buscarPeloId(@PathVariable Long id){
		Optional<Tarefa> tarefa = this.tarefaRepository.findById(id);
		return tarefa.isPresent() ? ResponseEntity.ok(tarefa) : ResponseEntity.notFound().build();
	}

	@DeleteMapping("{/id}")	
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@PreAuthorize("hasAuthority('CADASTRAR_TAREFA') and #oauth2.hasScope('write')")	//se pode cadastrar, pode remover
		public void remover(@PathVariable Long id) {
		this.tarefaRepository.deleteById(id);
	}
	
	
}