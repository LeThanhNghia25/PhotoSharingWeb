package Dao;

import java.util.List;

import javax.xml.stream.events.Comment;

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

    public Img getImgById(int id) {
        return photoRepository.findImgById(id);
    }

}
