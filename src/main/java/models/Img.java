package models;

import java.util.ArrayList;
import java.util.List;

import models.*;

public class Img extends entry {
	private int id;
	private List<comment> commnet = new ArrayList<comment>();

	public Img() {

	}

	public Img(int id, String title, String content, String img, String createdTime, user creator, catalog cata,
			String status) {
		super(title, content, img, createdTime, creator, cata, status);
		this.id = id;
		this.title = title;
		this.content = content;
		this.img = img;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<comment> getCommnet() {
		return commnet;
	}

	public void setCommnet(List<comment> commnet) {
		this.commnet = commnet;
	}

}
