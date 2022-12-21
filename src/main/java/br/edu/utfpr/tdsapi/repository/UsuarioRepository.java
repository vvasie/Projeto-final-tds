package br.edu.utfpr.tdsapi.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import br.edu.utfpr.tdsapi.model.Usuario;


	public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
		
		public Optional<Usuario> findByNome(String nome);	 
	}
