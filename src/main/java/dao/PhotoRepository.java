package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import models.Img;
import models.admin;
import models.catalog;
import models.comment;
import models.User;

@Repository
public class PhotoRepository {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static class UserRowMapper implements RowMapper<User> {
		@Override
		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			User user = new User();
			user.setId(rs.getInt("id"));
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			user.setAvatar(rs.getString("avatar"));
			user.setDescription(rs.getString("description"));
			user.setEmail(rs.getString("email"));
			user.setBirthday(rs.getDate("birthday"));
			user.setStatus(rs.getString("status"));
			return user;
		}
	}

	private static class CateRowMapper implements RowMapper<catalog> {
		@Override
		public catalog mapRow(ResultSet rs, int rowNum) throws SQLException {
			catalog catalog = new catalog();
			catalog.setId(rs.getInt("id"));
			catalog.setCatalogname(rs.getString("catalogname"));
			return catalog;
		}
	}

	private static class AdminRowMapper implements RowMapper<admin> {
		@Override
		public admin mapRow(ResultSet rs, int rowNum) throws SQLException {
			admin admin = new admin();
			admin.setId(rs.getInt("id"));
			admin.setUsername(rs.getString("username"));
			admin.setPassword(rs.getString("password"));
			admin.setAvatar(rs.getString("avatar"));
			admin.setEmail(rs.getString("email"));
			admin.setBirthday(rs.getDate("birthday"));
			admin.setStatus(rs.getString("status"));
			return admin;
		}
	}

	private static class ImgRowMapper implements RowMapper<Img> {
		@Override
		public Img mapRow(ResultSet rs, int rowNum) throws SQLException {
			Img img = new Img();
			img.setId(rs.getInt("id"));
			img.setTitle(rs.getString("title"));
			img.setContent(rs.getString("content"));
			img.setImg(rs.getString("img"));
			img.setCreatedTime(rs.getString("createdTime"));
			img.setStatus(rs.getString("status"));
			img.setUserid(rs.getInt("userid"));
			return img;
		}

	}

	private static class ImgAdminRowMapper implements RowMapper<Img> {
		@Override
		public Img mapRow(ResultSet rs, int rowNum) throws SQLException {
			Img img = new Img();
			img.setId(rs.getInt("id"));
			img.setTitle(rs.getString("title"));
			img.setContent(rs.getString("content"));
			img.setImg(rs.getString("img"));
			img.setCreatedTime(rs.getString("createdTime"));
			User creator = new User();
			creator.setId(rs.getInt("id"));
			creator.setUsername(rs.getString("username"));
			creator.setEmail(rs.getString("email"));
			creator.setAvatar(rs.getString("avatar"));
			img.setCreator(creator);
			catalog cata = new catalog();
			cata.setId(rs.getInt("id"));
			cata.setCatalogname(rs.getString("catalogname"));
			img.setUserid(rs.getInt("userid"));
			img.setCata(cata);
			img.setStatus(rs.getString("status"));

			return img;
		}
	}

	private static class CommentRowMapper implements RowMapper<comment> {
		@Override
		public comment mapRow(ResultSet rs, int rowNum) throws SQLException {
			int idpost = rs.getInt("idpost");
			String content = rs.getString("content");
			String createdTime = rs.getString("createdTime");
			User creator = new User();
			creator.setId(rs.getInt("userid"));
			creator.setUsername(rs.getString("username"));
			creator.setAvatar(rs.getString("avatar"));
			return new comment(idpost, content, createdTime, creator);
		}
	}

	public List<User> findAllUser() {
		return jdbcTemplate.query("SELECT * FROM user", new UserRowMapper());
	}

	public List<Img> findAllImg() {
		return jdbcTemplate.query("SELECT * FROM img", new ImgRowMapper());
	}

	public List<catalog> findAllCate() {
		return jdbcTemplate.query("SELECT * FROM catalog", new CateRowMapper());
	}

	public List<Img> findAllImgAdmin() {
		String sql = "SELECT img.id, img.title, img.content, img.img, img.createdTime,img.userid, img.status, user.id, user.email, user.username, user.avatar, catalog.id,"
				+ " catalog.catalogname FROM img JOIN user ON img.userid = user.id JOIN catalog ON img.cate = catalog.id";
		return jdbcTemplate.query(sql, new ImgAdminRowMapper());
	}

	public int saveImg(Img img) {
		String sql = "INSERT INTO img (title, content, img, createdTime, userid, cate, status ) VALUES (?, ?, ?, ?, ?, ?, ?)";
		return jdbcTemplate.update(sql, img.getTitle(), img.getContent(), img.getImg(), img.getCreatedTime(),
				img.getCreator().getId(), img.getCata().getId(), img.getStatus());
	}
	public int saveCate(catalog catalog) {
		String sql = "INSERT INTO catalog (catalogname) VALUES (?)";
		return jdbcTemplate.update(sql, catalog.getCatalogname());
	}
	public int updateImg(Img img) {
		String sql = "UPDATE img SET title = ?, content = ?, img = ?, createdTime = ?, status = ? WHERE id = ?";
		return jdbcTemplate.update(sql, img.getTitle(), img.getContent(), img.getImg(), img.getCreatedTime(),
				img.getStatus(), img.getId());
	}

	public int deleteImg(int imgId) {
		String sql = "DELETE FROM img WHERE id = ?";
		return jdbcTemplate.update(sql, imgId);
	}
	public int deleteCate(int cateId) {
		String sql = "DELETE FROM catalog WHERE id = ?";
		return jdbcTemplate.update(sql, cateId);
	}
	public int deleteUser(int idUser) {
		String sql = "DELETE FROM user WHERE id = ?";
		return jdbcTemplate.update(sql, idUser);
	}
	public int deleteUserRole(int idUser) {
		String sql = "DELETE FROM users_roles WHERE userId = ?";
		return jdbcTemplate.update(sql, idUser);
	}
	public int updateUserAD(User user) {
		String sql = "UPDATE user SET username = ?, status = ? WHERE id = ?";
		return jdbcTemplate.update(sql, user.getUsername(), user.getStatus(), user.getId());
	}

	public void RegistorUser(User newUser) {
		String sql = "INSERT INTO user (username, password,avatar, email, birthday, status) VALUES (?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, newUser.getUsername(), newUser.getPassword(), newUser.getAvatar(), newUser.getEmail(),
				newUser.getBirthday(), newUser.getStatus());
	}

	public boolean isEmailExist(String email) {
		String sql = "SELECT COUNT(*) FROM user WHERE email = ?";
		int count = jdbcTemplate.queryForObject(sql, new Object[] { email }, Integer.class);
		return count > 0;
	}

	public User findUserByEmailAndPassword(String email, String password) {
		String sql = "SELECT * FROM user WHERE email = ? AND password = ?";
		List<User> users = jdbcTemplate.query(sql, new Object[] { email, password }, new UserRowMapper());
		if (users.isEmpty()) {
			return null;
		} else {
			return users.get(0);
		}
	}

	public admin findAdminByEmailAndPassword(String username, String password) {
		String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
		List<admin> admins = jdbcTemplate.query(sql, new Object[] { username, password }, new AdminRowMapper());
		if (admins.isEmpty()) {
			return null;
		} else {
			return admins.get(0);
		}
	}

	public Img findImgById(int id) {
		String sql = "SELECT img.id, img.title, img.content, img.img, img.userid, img.createdTime, img.status, user.id, user.email, user.avatar, user.username, catalog.id, catalog.catalogname FROM img JOIN user ON img.userid = user.id JOIN catalog ON img.cate = catalog.id WHERE img.id = ?";
		List<Img> imgs = jdbcTemplate.query(sql, new Object[] { id }, new ImgAdminRowMapper());
		return imgs.isEmpty() ? null : imgs.get(0);
	}

	public User findUserById(int id) {
		String sql = "SELECT * from user WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new UserRowMapper());
	}

	public List<Img> findAllImgByUserId(int userId) {
		String sql = "SELECT * FROM img WHERE userid = ?";
		return jdbcTemplate.query(sql, new ImgRowMapper(), userId);
	}
	public List<comment> showAllComments() {
	    String sql = "SELECT * FROM comment " +
	                 "JOIN img ON comment.idpost = img.id " +
	                 "JOIN user ON comment.userid = user.id;";
	    return jdbcTemplate.query(sql, new CommentRowMapper());
	}
	public List<comment> showallcomment(int idpost) {
		String sql = "SELECT img.id, user.*, comment.* FROM comment JOIN img ON comment.idpost = img.id JOIN user ON comment.userid = user.id WHERE comment.idpost = ?";
		return jdbcTemplate.query(sql, new Object[] { idpost }, new CommentRowMapper());
	}

	public int insertComment(comment comment) {
		String sql = "INSERT INTO comment (userid, idpost, createdTime, content) VALUES (?, ?, ?, ?)";
		return jdbcTemplate.update(sql, comment.getCreator().getId(), comment.getIdpost(), comment.getCreatedTime(),
				comment.getContent());
	}

	public int updateavatar(User user) {
		String sql = "UPDATE user SET avatar = ? WHERE id = ?";
		return jdbcTemplate.update(sql, user.getAvatar(), user.getId());
	}

	public int updateProfile(User user) {
	    String sql = "UPDATE user SET username = ?, `description` = ? WHERE id = ?";
	    return jdbcTemplate.update(sql, user.getUsername(), user.getDescription(), user.getId());
	}


	public boolean checkPassword(User user) {
		String sql = "SELECT COUNT(*) FROM user WHERE id = ? AND password = ?";
		int count = jdbcTemplate.queryForObject(sql, Integer.class, user.getId(), user.getPassword());
		return count == 1;
	}

	public int updatePassword(User user) {
		String sql = "UPDATE user SET password = ? WHERE id = ?";
		return jdbcTemplate.update(sql, user.getPassword(), user.getId());
	}
	
	public List<Img> searchImgs(String query) {
        String sql = "SELECT * FROM img WHERE title LIKE ?";
        return jdbcTemplate.query(sql, new Object[]{"%" + query + "%"}, new ImgRowMapper());
    }

	public static void main(String[] args) {

	}

	
}
