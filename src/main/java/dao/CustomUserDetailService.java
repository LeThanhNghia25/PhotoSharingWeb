package dao;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import models.User;
import models.UserRole;


@Service
public class CustomUserDetailService implements UserDetailsService {
    
    @Autowired 
    private UserDAO userDAO;
    
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return loadUser(email);
    }
    
    private UserDetails loadUser(String email) {
        User user = userDAO.findByEmail(email);
        System.out.println(user);
        System.out.println(email);
        if (user == null){
            return null;
        }
        
        Collection<GrantedAuthority> grantedAuthoritySet = new HashSet<>();
        Set<UserRole> roles = user.getUserRoles();
        
        for (UserRole userRole : roles) {
            grantedAuthoritySet.add(new SimpleGrantedAuthority(userRole.getRole().getName()));
        }
        
        return new CustomUserDetails(user, grantedAuthoritySet);
    }

}
