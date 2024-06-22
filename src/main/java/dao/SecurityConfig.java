package dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {"models", "dao"})
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf(csrf -> csrf.disable())
            .authorizeRequests(auth -> auth
                .antMatchers("/", "/home/**", "/login", "/register", "/resources/**", "/liveSearch", "/searchResults", "/detail").permitAll()
                .antMatchers("/details").hasAnyAuthority("ROLE_ADMIN", "ROLE_USER")
                .antMatchers("/admin/**").hasAuthority("ROLE_ADMIN")
                .anyRequest().authenticated())
            .formLogin(login -> login
                .loginPage("/login")
                .loginProcessingUrl("/spring_security_login")
                .usernameParameter("email")
                .passwordParameter("password")
                .defaultSuccessUrl("/home", true)
                .failureUrl("/login?error"))
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID"))
            .exceptionHandling().accessDeniedPage("/accessDenied");
    }

    @Bean
    WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring().antMatchers("/resources/**");
    }
}
