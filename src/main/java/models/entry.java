package models;

import javax.validation.constraints.NotBlank;

public class entry {
	protected int idpost;

	@NotBlank(message = "Tiêu đề không được để trống")
	protected String title;
	protected String content;
	protected String img;
	protected String createdTime;
	protected User creator;
	protected catalog cata;
	protected String status;

	public entry() {

	}

	public entry(@NotBlank(message = "Tiêu đề không được để trống") String title, String content,
			String img, String createdTime, User creator, catalog cata,
			String status) {
		super();
		this.title = title;
		this.content = content;
		this.img = img;
		this.createdTime = createdTime;
		this.creator = creator;
		this.cata = cata;
		this.status = status;
	}

	public entry(int idpost, String content, String createdTime, User creator) {
		super();
		this.idpost = idpost;
		this.content = content;
		this.createdTime = createdTime;
		this.creator = creator;

	}

	public int getIdpost() {
		return idpost;
	}

	public void setIdpost(int idpost) {
		this.idpost = idpost;
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

	public catalog getCata() {
		return cata;
	}

	public void setCata(catalog cata) {
		this.cata = cata;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
