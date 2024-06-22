package models;

import java.util.ArrayList;
import java.util.List;

public class Img extends Entry {
	private int id;
	private List<Comment> commnent = new ArrayList<Comment>();

	public Img() {

	}

	public Img(int id, List<Comment> commnet) {
		super();
		this.id = id;
		this.commnent = commnet;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Comment> getCommnet() {
		return commnent;
	}

	public void setCommnet(List<Comment> commnet) {
		this.commnent = commnet;
	}

}
