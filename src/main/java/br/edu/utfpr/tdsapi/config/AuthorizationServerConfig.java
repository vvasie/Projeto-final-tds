package br.edu.utfpr.tdsapi.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;

@Profile("oauth_security")
@Configuration
public class AuthorizationServerConfig extends AuthorizationServerConfigurerAdapter{
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Override
	public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
		clients.inMemory()
				// Simulação de client com escopo read e write
				.withClient("angular")
				.secret("$2a$10$uUFt/OEV7syG4zcCo.k3.u81et49.syW66r09xRsM4AGgrkyX0eZO") // @ngul@r0
				.scopes("read", "write")
				.authorizedGrantTypes("password", "refresh_token")
				.accessTokenValiditySeconds(180) // token vai expirar 15 minutos
				.refreshTokenValiditySeconds(3600*12) // refresh token vai expirar em 12 horas
			; // refresh token expira em 1 dia
	}
	
	@Override
	public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
		// Token utilizado para adicionar o nome do usuário logado
		//TokenEnhancerChain tokenEnhancerChain = new TokenEnhancerChain();
		//tokenEnhancerChain.setTokenEnhancers(Arrays.asList(tokenEnhancer(), accessTokenConverter()));
		
		endpoints
		.tokenStore(tokenStore())
		.accessTokenConverter(accessTokenConverter())
	//	.tokenEnhancer(tokenEnhancerChain)
		.reuseRefreshTokens(false)
		.userDetailsService(userDetailsService)
		.authenticationManager(authenticationManager);
	}
	
	@Bean
	public JwtAccessTokenConverter accessTokenConverter() {
			JwtAccessTokenConverter accessTokenConverter = new JwtAccessTokenConverter();
			accessTokenConverter.setSigningKey("tds");
			return accessTokenConverter;
	}

	@Bean
	public TokenStore tokenStore() {
		return new JwtTokenStore(accessTokenConverter());
	}

}
