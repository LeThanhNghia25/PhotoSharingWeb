package Dao;

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

	public User checkUser(String email, String password) {
		return photoRepository.findUserByUsernameAndPassword(email, password);
	}

	public void saveUser(User newUser) {
	    photoRepository.saveUser(newUser);
	}

	public boolean checkEmailExists(String email) {
	    User user = photoRepository.findUserByEmail(email);
	    return user != null;
	}


}
