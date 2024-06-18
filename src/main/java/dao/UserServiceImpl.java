package dao;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import models.Role;
import models.User;
import models.UserRole;

@Service("userDetailsService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public boolean addUser(User user) {
		String pass = user.getPassword();
	    user.setPassword(this.passwordEncoder.encode(pass)); 
	    return this.userRepository.addUser(user);
	}

	@Override
	public User getUsers(String email) {
		return this.userRepository.getUsers(email);
	}

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		User user = this.getUsers(email);
		 if (user == null) {
		        throw new UsernameNotFoundException("Email: " + email + " does not exist !");
		    }
		    Set<GrantedAuthority> authorities = new HashSet<>();
		    Set<UserRole> userRoles = user.getUserRoles();
		    for (UserRole userRole : userRoles) {
		        authorities.add(new SimpleGrantedAuthority(userRole.getRole().getName()));
		    }

		    return new org.springframework.security.core.userdetails.User(
		            user.getEmail(),
		            user.getPassword(),
		            authorities
		    );
	}
}
