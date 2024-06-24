package dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import models.Img;
import models.admin;
import models.catalog;
import models.comment;
import models.user;

@Service
public class PhotoService {
	@Autowired
	private PhotoRepository photoRepository;

	public List<user> getAllUsers() {
		return photoRepository.findAllUser();
	}

	public List<Img> getAllImg() {
		return photoRepository.findAllImg();
	}

	public List<catalog> getAllCate() {
		return photoRepository.findAllCate();
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

	public int deleteCate(int cateId) {
		return photoRepository.deleteCate(cateId);
	}

	public int deleteUser(int idUser) {
		return photoRepository.deleteUser(idUser);
	}

	public int updateUserAd(user user) {
		return photoRepository.updateUserAD(user);
	}

	public void RegistorUser(user newUser) {
		photoRepository.RegistorUser(newUser);
	}

	public user checkUser(String email, String password) {
		return photoRepository.findUserByEmailAndPassword(email, password);
	}

	public admin checkAdmin(String username, String password) {
		return photoRepository.findAdminByEmailAndPassword(username, password);
	}

	public boolean isEmailExist(String email) {
		return photoRepository.isEmailExist(email);
	}

	public Img findImgById(int id) {
		return photoRepository.findImgById(id);

	}

	public user findUserById(int id) {
		return photoRepository.findUserById(id);
	}

	public List<Img> findAllImgByUserId(int userId) {
		return photoRepository.findAllImgByUserId(userId);
	}

	public List<comment> showallcomment(int idpost) {
		return photoRepository.showallcomment(idpost);
	}

	public int insertComment(comment comment) {
		return photoRepository.insertComment(comment);
	}
	public int saveCate(catalog catalog) {
		return photoRepository.saveCate(catalog);
	}
	public int updateavatar(user user) {
		return photoRepository.updateavatar(user);
	}

	public int updateProfile(user user) {
		return photoRepository.updateProfile(user);
	}

	public boolean checkPassword(user user) {
		return photoRepository.checkPassword(user);
	}

	public int updatePassword(user user) {
		return photoRepository.updatePassword(user);
	}
}
