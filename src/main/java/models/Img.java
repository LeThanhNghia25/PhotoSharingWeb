package models;

import java.util.ArrayList;
import java.util.List;

import models.*;

public class Img extends entry {
	private int id;
	private List<comment> commnet = new ArrayList<comment>();

	public Img() {

	}



	public Img(int id, List<comment> commnet) {
		super();
		this.id = id;
		this.commnet = commnet;
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
