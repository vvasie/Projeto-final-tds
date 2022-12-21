package br.edu.utfpr.tdsapi.resource;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import br.edu.utfpr.tdsapi.repository.PrioridadeRepository;
import br.edu.utfpr.tdsapi.model.Prioridade;

@RestController
@RequestMapping("/prioridades")
public class PrioridadeResource {
	
	@Autowired
	private PrioridadeRepository prioridadeRepository;
	
	@GetMapping
	public List<Prioridade> listar() {
		return prioridadeRepository.findAll();
		
	}
	
	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('PESQUISAR_PRIORIDADE') and #oauth2.hasScope('read')")
	public ResponseEntity<?> buscarPeloId(@PathVariable Long id){
		Optional<Prioridade> prioridade = this.prioridadeRepository.findById(id);
		return prioridade.isPresent() ? ResponseEntity.ok(prioridade) : ResponseEntity.notFound().build();
	}

	@DeleteMapping("{/id}")	
	@ResponseStatus(HttpStatus.NO_CONTENT)	
		public void remover(@PathVariable Long id) {
		this.prioridadeRepository.deleteById(id);
	}

}
