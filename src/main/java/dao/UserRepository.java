package dao;

import models.User;

public interface UserRepository {
	boolean addUser(User user);
	User getUsers(String email);
}
