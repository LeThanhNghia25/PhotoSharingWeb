package dao;

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

	public int deleteUser(int idUser) {
		return photoRepository.deleteUser(idUser);
	}

	public int updateUserAd(User user) {
		return photoRepository.updateUserAD(user);
	}

	public void RegistorUser(User newUser) {
		photoRepository.RegistorUser(newUser);
	}

	public User checkUser(String email, String password) {
		return photoRepository.findUserByEmailAndPassword(email, password);
	}

	public boolean isEmailExist(String email) {
		return photoRepository.isEmailExist(email);
	}

	public Img findImgById(int id) {
		return photoRepository.findImgById(id);
	}

	 public List<Img> searchImgs(String query) {
	        return photoRepository.searchImgs(query);
	    }

}
