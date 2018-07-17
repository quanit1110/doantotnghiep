package quanpham.nashtech.musicstore.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	/*@Autowired
	private CustomAuthenticationSuccessHandler successHandler;*/
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http
			.csrf().disable()
			.authorizeRequests()
			.antMatchers("/admin/**").hasRole("ADMIN")		
			.and()
			.formLogin().loginPage("/login")/*.successHandler(successHandler)*/
	        .permitAll()
	        .loginProcessingUrl("/login")
	        .and().logout().logoutUrl("/logout").logoutSuccessUrl("/")
			;
		http
        .authorizeRequests()
            .antMatchers("/shippinginformation" , "/addShippinginfo")
            .hasAnyRole("ADMIN", "USER");
		http.authorizeRequests().antMatchers("/register").permitAll();
		
	}

}
