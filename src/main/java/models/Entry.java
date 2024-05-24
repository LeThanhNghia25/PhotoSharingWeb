package models;

import java.util.Calendar;

import models.User;

public class Entry {
	private String title;
	private String content;
	private String img;
	private String createdTime;
	private User creator;
	private String status;
public Entry() {
	
}
	public Entry(String title, String content, String img, String createdTime, User creator, String status) {
		super();
		this.title = title;
		this.content = content;
		this.img = img;
		this.createdTime = createdTime;
		this.creator = creator;
		this.status = status;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
