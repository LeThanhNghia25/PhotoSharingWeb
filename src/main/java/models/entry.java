package models;

public class entry {
	protected String title;
	protected String content;
	protected String img;
	protected String createdTime;
	protected user creator;
	protected catalog cata;
	protected String status;

	public entry() {

	}

	public entry(String title, String content, String img, String createdTime, user creator, catalog cata,
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

	public user getCreator() {
		return creator;
	}

	public void setCreator(user creator) {
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
