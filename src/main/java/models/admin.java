package models;

import java.util.Date;

public class admin extends User {
	private String adminCode;

	public admin() {

	}

	public admin(int id, String username, String password, String describe, String email, Date birthday, String status,
			String adminCode) {
		// Call the superclass constructor to initialize user fields
		super(id, username, password, describe, email, birthday, status);
		this.adminCode = adminCode;
	}

	public String getAdminCode() {
		return adminCode;
	}

	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
	}

}
