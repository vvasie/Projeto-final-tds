package br.edu.utfpr.tdsapi.resource;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.edu.utfpr.tdsapi.model.Responsavel;
import br.edu.utfpr.tdsapi.repository.ResponsavelRepository;

@RestController
@RequestMapping("/responsaveis")
public class ResponsavelResource {
	
	@Autowired
	private ResponsavelRepository responsavelRepository;
	
	@GetMapping
	public List<Responsavel> listar() {
		return responsavelRepository.findAll();
		
	}
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public void criar(@RequestBody Responsavel responsavel) {
		responsavelRepository.save(responsavel);
	}

	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('PESQUISAR_RESPONSAVEL') and #oauth2.hasScope('read')")
	public ResponseEntity<?> buscarPeloId(@PathVariable Long id){
		Optional<Responsavel> responsavel = this.responsavelRepository.findById(id);
		return responsavel.isPresent() ? ResponseEntity.ok(responsavel) : ResponseEntity.notFound().build();
	}

	
}
