package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

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
			return img;
		}

	}

	public List<User> findAllUser() {
		return jdbcTemplate.query("SELECT * FROM user", new UserRowMapper());
	}

	public List<Img> findAllImg() {
		return jdbcTemplate.query("SELECT * FROM img", new ImgRowMapper());
	}

	public User findUserByUsernameAndPassword(String email, String password) {
		String sql = "SELECT * FROM user WHERE email = ? AND password = ?";
		List<User> users = jdbcTemplate.query(sql, new Object[] { email, password }, new UserRowMapper());
		if (users.isEmpty()) {
			return null;
		} else {
			return users.get(0);
		}
	}
	
	public void saveUser(User newUser) {
	    String sql = "INSERT INTO user (username, password, email, birthday) VALUES (?, ?, ?, ?)";
	    jdbcTemplate.update(sql, newUser.getUsername(), newUser.getPassword(), newUser.getEmail(), newUser.getBirthday());
	}
	
    public Img findImgById(int id) {
        String sql = "SELECT * FROM img WHERE id = ?";
        List<Img> imgs = jdbcTemplate.query(sql, new Object[] { id }, new ImgRowMapper());
        if (imgs.isEmpty()) {
            return null;
        } else {
            return imgs.get(0);
        }
    }
	
}
