package models;


import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@NotEmpty(message = "Ten khong duoc de trong")
	@Column(name = "username", nullable = false)
	private String username;

	@NotEmpty(message = "Password không được trống")
	@Size(min = 6, message = "Password phải có ít nhất 6 ký tự")
	@Column(name = "password", nullable = false)
	private String password;
	
	private String avatar;

	@Column(name = "description")
	private String description;

	@NotEmpty(message = "Email không được trống")
	@Email(message = "Email không hợp lệ")
	@Column(name = "email", nullable = false)
	private String email;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;

	@Column(name = "status")
	private String status;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<UserRole> userRoles;

	public User() {

	}

	public User(int id, @NotEmpty(message = "Ten khong duoc de trong") String username,
			@NotEmpty(message = "Password không được trống") @Size(min = 6, message = "Password phải có ít nhất 6 ký tự") String password,
			String description,
			@NotEmpty(message = "Email không được trống") @Email(message = "Email không hợp lệ") String email,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday, String status) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.description = description;
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

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<UserRole> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(Set<UserRole> userRoles) {
		this.userRoles = userRoles;
	}

}
