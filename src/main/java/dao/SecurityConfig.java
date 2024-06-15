package dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	@Autowired
	private CustomUserDetailService customUserDetailService;

	@Bean
	BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
	    http.csrf(csrf -> csrf.disable())
	        .authorizeRequests(auth -> auth
	            .antMatchers("/", "/home", "/login", "/register").permitAll()
	            .antMatchers("/details").hasAnyAuthority("ROLE_ADMIN", "ROLE_USER")
	            .antMatchers("/admin/**").hasAuthority("ROLE_ADMIN")
	            .anyRequest().authenticated())
	        .formLogin(login -> login
	            .loginPage("/login")
	            .loginProcessingUrl("/spring_security_login")
	            .usernameParameter("email")
	            .passwordParameter("password")
	            .defaultSuccessUrl("/home", true))
	        .logout(logout -> logout
	            .logoutUrl("/logout")
	            .logoutSuccessUrl("/login")
	            .invalidateHttpSession(true)
	            .deleteCookies("JSESSIONID"))
	        .exceptionHandling(exception -> exception
	            .accessDeniedHandler((request, response, accessDeniedException) -> {
	                response.sendRedirect("/PhotoSharingWeb/login");
	                request.getSession().setAttribute("message", "Bạn không có quyền truy cập vào trang này!");
	            }));
	    return http.build();
	}


	@Bean
	WebSecurityCustomizer webSecurityCustomizer() {
		return (web) -> web.ignoring().antMatchers("/resources/**");
	}
}
