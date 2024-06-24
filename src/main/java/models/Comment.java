package models;

public class comment extends entry {
	public comment() {
		
	}
	public comment(int idpost, String content, String createdTime, user creator) {
		super(idpost, content, createdTime, creator);

	}

}
