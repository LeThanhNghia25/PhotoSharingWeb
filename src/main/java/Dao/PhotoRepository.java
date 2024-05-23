package Dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
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
	 public List<User> findAll() {
	        return jdbcTemplate.query("SELECT * FROM user", new UserRowMapper());
	    }
public static void main(String[] args) {
	
}
}
