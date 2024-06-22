package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import models.Img;
import models.Catalog;
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
			user.setEnabled(rs.getBoolean("enabled"));
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
			img.setEnabled(rs.getBoolean("enabled"));
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
			creator.setEmail(rs.getString("email"));
			img.setCreator(creator);
			Catalog cata = new Catalog();
			cata.setId(rs.getInt("id"));
			cata.setCatalogname(rs.getString("catalogname"));
			img.setCata(cata);
			img.setEnabled(rs.getBoolean("enabled"));

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
		String sql = "SELECT img.id, img.title, img.content, img.img, img.createdTime, img.enabled, user.id, user.email, catalog.id,"
				+ " catalog.catalogname FROM img JOIN user ON img.creator = user.id JOIN catalog ON img.cate = catalog.id";
		return jdbcTemplate.query(sql, new ImgAdminRowMapper());
	}

	public int saveImg(Img img) {
		String sql = "INSERT INTO img (title, content, img, createdTime, creator, cate, enabled ) VALUES (?, ?, ?, ?, ?, ?, ?)";
		return jdbcTemplate.update(sql, img.getTitle(), img.getContent(), img.getImg(), img.getCreatedTime(),
				img.getCreator().getUsername(), img.getEnabled(), img.getCata().getCatalogname());
	}

	public int updateImg(Img img) {
		String sql = "UPDATE img SET title = ?, content = ?, img = ?, createdTime = ?, enabled = ? WHERE id = ?";
		return jdbcTemplate.update(sql, img.getTitle(), img.getContent(), img.getImg(), img.getCreatedTime(),
				img.getEnabled(), img.getId());
	}

	public int deleteImg(int imgId) {
		String sql = "DELETE FROM img WHERE id = ?";
		return jdbcTemplate.update(sql, imgId);
	}

	public int deleteUser(int idUser) {
		String sql = "DELETE FROM user WHERE id = ?";
		return jdbcTemplate.update(sql, idUser);
	}
	public int updateUserAD(User user) {
		String sql = "UPDATE user SET username = ?, enabled = ? WHERE id = ?";
		return jdbcTemplate.update(sql, user.getUsername(), user.getEnabled(), user.getId());
	}

	public void RegistorUser(User newUser) {
		String sql = "INSERT INTO user (username, password, email, birthday, enabled) VALUES (?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, newUser.getUsername(), newUser.getPassword(), newUser.getEmail(),
				newUser.getBirthday(), newUser.getEnabled());
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
	public Img findImgById(int id) {
		String sql = "SELECT img.id, img.title, img.content, img.img, img.createdTime, img.enabled, user.id, user.email, catalog.id,"
				+ " catalog.catalogname FROM img JOIN user ON img.creator = user.id JOIN catalog ON img.cate = catalog.id WHERE img.id = ?";
	    return jdbcTemplate.queryForObject(sql, new Object[]{id}, new ImgAdminRowMapper());
	}
	
	public List<Img> searchImgs(String query) {
        String sql = "SELECT * FROM img WHERE title LIKE ?";
        return jdbcTemplate.query(sql, new Object[]{"%" + query + "%"}, new ImgRowMapper());
    }

}
