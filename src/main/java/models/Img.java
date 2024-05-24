package models;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import models.*;

public class Img extends Entry {
	private int id;
	private List<Comment> commnet = new ArrayList<Comment>();
	private Category category;

	public Img() {

	}

	public Img(int id, String title, String content, String img, String createdTime, User creator, String status,
			Category category) {
		super(status, content, img, createdTime, creator, status);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Comment> getCommnet() {
		return commnet;
	}

	public void setCommnet(List<Comment> commnet) {
		this.commnet = commnet;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}
