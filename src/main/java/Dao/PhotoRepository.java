package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import models.Category;
import models.Img;
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
			user.setEmail(rs.getString("email"));
			user.setBirthday(rs.getDate("birthday"));
			user.setStatus(rs.getString("status"));
			return user;
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
			Category category = new Category();
			category.setId(rs.getInt("id"));
			category.setTitle(rs.getString("title"));
			img.setCategory(category);

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
			img.setStatus(rs.getString("status"));

			User creator = new User();
			creator.setId(rs.getInt("id"));
			creator.setUsername(rs.getString("username"));
			img.setCreator(creator);

			Category category = new Category();
			category.setId(rs.getInt("id"));
			category.setTitle(rs.getString("title"));
			img.setCategory(category);

			return img;
		}
	}

	public List<User> findAllUser() {
		return jdbcTemplate.query("SELECT * FROM user", new UserRowMapper());
	}

	public List<Img> findAllImg() {
		return jdbcTemplate.query("SELECT * FROM img", new ImgRowMapper());
	}

	public List<Img> findAllImgAdmin() {
		String sql = "SELECT img.id, " + "img.title, " + "img.content, " + "img.img, " + "img.createdTime, "
				+ "img.status, " + "user.id, " + "user.username, " + "category.id, " + "category.title " + "FROM img "
				+ "JOIN user ON img.creator = user.id " + "JOIN category ON img.category = category.id";
		return jdbcTemplate.query(sql, new ImgAdminRowMapper());
	}

	public User findUserByUsernameAndPassword(String username, String password) {
		String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
		List<User> users = jdbcTemplate.query(sql, new Object[] { username, password }, new UserRowMapper());
		if (users.isEmpty()) {
			return null;
		} else {
			return users.get(0);
		}
	}

	public int saveImg(Img img) {
		String sql = "INSERT INTO img (title, content, img, createdTime, creator, status, category) VALUES (?, ?, ?, ?, ?, ?, ?)";
		return jdbcTemplate.update(sql, img.getTitle(), img.getContent(), img.getImg(), img.getCreatedTime(),
				img.getCreator().getUsername(), img.getStatus(), img.getCategory().getTitle());
	}

	public int updateImg(Img img) {
		String sql = "UPDATE img SET title = ?, content = ?, img = ?, createdTime = ?, creator = ?, status = ?, category = ? WHERE id = ?";
		return jdbcTemplate.update(sql, img.getTitle(), img.getContent(), img.getImg(), img.getCreatedTime(),
				img.getCreator().getUsername(), img.getStatus(), img.getCategory().getTitle(), img.getId());
	}

	public int deleteImg(int imgId) {
		String sql = "DELETE FROM img WHERE id = ?";
		return jdbcTemplate.update(sql, imgId);
	}

	public void saveUser(User newUser) {
		String sql = "INSERT INTO user (username, password, email, birthday) VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(sql, newUser.getUsername(), newUser.getPassword(), newUser.getEmail(),
				newUser.getBirthday());
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
	public static void main(String[] args) {

	}
}
