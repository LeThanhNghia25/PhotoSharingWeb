package dao;

import models.User;

public interface UserDAO {
	public User findByEmail(String email);
}
