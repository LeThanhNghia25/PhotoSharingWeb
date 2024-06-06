package models;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class user {
	private int id;
	@NotEmpty(message = "Username không được trống")
	private String username;

	@NotEmpty(message = "Password không được trống")
	@Size(min = 6, message = "Password phải có ít nhất 6 ký tự")
	private String password;

	private String describe;

	@NotEmpty(message = "Email không được trống")
	@Email(message = "Email không hợp lệ")
	private String email;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;

	private String status;

	public user() {

	}

	public user(int id, @NotEmpty(message = "Username không được trống") String username,
			@NotEmpty(message = "Password không được trống") @Size(min = 6, message = "Password phải có ít nhất 6 ký tự") String password,
			String describe,
			@NotEmpty(message = "Email không được trống") @Email(message = "Email không hợp lệ") String email,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday, String status) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.describe = describe;
		this.email = email;
		this.birthday = birthday;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
