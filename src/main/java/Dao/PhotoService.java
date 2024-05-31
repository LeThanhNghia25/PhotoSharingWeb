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

	public List<Img> getAllImgAdmin() {
		return photoRepository.findAllImgAdmin();
	}



	public int saveImg(Img img) {
		return photoRepository.saveImg(img);
	}

	public int updateImg(Img img) {
		return photoRepository.updateImg(img);
	}

	public int delete(int imgId) {
		return photoRepository.deleteImg(imgId);
	}

	public void saveUser(User newUser) {
		photoRepository.saveUser(newUser);
	}
	  public User checkUser(String email, String password) {
	        return photoRepository.findUserByEmailAndPassword(email, password);
	    }
}
