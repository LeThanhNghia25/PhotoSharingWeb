package dao;

import org.springframework.security.core.userdetails.UserDetailsService;

import models.User;

public interface UserService extends UserDetailsService {
	boolean addUser(User user);
	User getUsers(String email);
}
