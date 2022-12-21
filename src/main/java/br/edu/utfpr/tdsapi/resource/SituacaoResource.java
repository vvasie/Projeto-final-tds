package br.edu.utfpr.tdsapi.resource;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.edu.utfpr.tdsapi.model.Situacao;
import br.edu.utfpr.tdsapi.repository.SituacaoRepository;

@RestController
@RequestMapping("/situacoes")
public class SituacaoResource {
	
	@Autowired
	private SituacaoRepository situacaoRepository;
	
	@GetMapping
	public List<Situacao> listar() {
		return situacaoRepository.findAll();
		
	}
	
	@GetMapping("/{id}")
	@PreAuthorize("hasAuthority('PESQUISAR_SITUACAO') and #oauth2.hasScope('read')")
	public ResponseEntity<?> buscarPeloId(@PathVariable Long id){
		Optional<Situacao> situacao = this.situacaoRepository.findById(id);
		return situacao.isPresent() ? ResponseEntity.ok(situacao) : ResponseEntity.notFound().build();
	}

}
