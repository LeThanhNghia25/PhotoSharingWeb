package Dao;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import models.Img;
import models.User;

@Service
public class PhotoService {
	@Autowired
	private PhotoRepository photoRepository;

	public List<User> getAllUsers() {
		return photoRepository.findAllUser();
	}

	public List<Img> getAllImg() {
		return photoRepository.findAllImg();
	}

	public User checkUser(String username, String password) {
		return photoRepository.findUserByUsernameAndPassword(username, password);
	}

}
