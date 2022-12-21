package br.edu.utfpr.tdsapi.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import br.edu.utfpr.tdsapi.model.Usuario;
import br.edu.utfpr.tdsapi.repository.UsuarioRepository;

@Service
public class UsuarioService {
	
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	public Usuario atualizar(@PathVariable Long id,@RequestBody Usuario usuario) {
		
		Usuario usuarioSalvo = this.usuarioRepository.findById(id)
				.orElseThrow(() -> new EmptyResultDataAccessException(1));
					
		BeanUtils.copyProperties(usuario, usuarioSalvo, "id"); // Copia os valores dos atributos de pessoa para pessoaSalva
		
		return usuarioRepository.save(usuarioSalvo);
	}	
}