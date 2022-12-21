package br.edu.utfpr.tdsapi.resource;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.edu.utfpr.tdsapi.event.RecursoCriadoEvent;
import br.edu.utfpr.tdsapi.model.Usuario;
import br.edu.utfpr.tdsapi.repository.UsuarioRepository;
//import br.edu.utfpr.tdsapi.service.UsuarioService;

@RestController
@RequestMapping("/usuarios")
public class UsuarioResource {
	
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Autowired
	private ApplicationEventPublisher publisher;
	
//	@Autowired
//	private UsuarioService usuarioService;	
	
	@GetMapping
	public List<Usuario> listar() {
		return usuarioRepository.findAll();		
	}
	
	@PostMapping	
	public ResponseEntity<Usuario> criar(@Valid @RequestBody Usuario usuario, HttpServletResponse response) {
		Usuario usuarioSalvo = usuarioRepository.save(usuario);
		
		publisher.publishEvent(new RecursoCriadoEvent(this, response, usuarioSalvo.getId()));
		
		return ResponseEntity.status(HttpStatus.CREATED).body(usuarioSalvo);		
	}
	@GetMapping("/{id}")
	public ResponseEntity<?> buscarPeloId(@PathVariable Long id){
		Optional<Usuario> usuario = this.usuarioRepository.findById(id);
		return usuario.isPresent() ? ResponseEntity.ok(usuario) : ResponseEntity.notFound().build();
	}
/*	
	@DeleteMapping("{/id}")	
	@ResponseStatus(HttpStatus.NO_CONTENT) 
	//@PreAuthorize("hasAuthority('REMOVER_USUARIO') and #oauth2.hasScope('write')")	
	public void remover(@PathVariable Long id) {
		this.usuarioRepository.deleteById(id);
	}
	
	 @PutMapping("/{/id}")
	 @PreAuthorize("hasAuthority('CADASTRAR_USUARIO') and #oauth2.hasScope('write')")
	 public ResponseEntity<Usuario> atualizar(@PathVariable Long id, @Valid @RequestBody Usuario usuario) {
		Usuario usuarioSalvo = usuarioService.atualizar(id, usuario);
		return ResponseEntity.ok(usuarioSalvo);
*/	
	
	
}

