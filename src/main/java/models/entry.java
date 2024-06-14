package models;

public class entry {
	protected String title;
	protected String content;
	protected String img;
	protected String createdTime;
	protected User creator;
	protected catalog cata;
	protected boolean enabled;

	public entry() {

	}

	public entry(String title, String content, String img, String createdTime, User creator, catalog cata,
			boolean enabled) {
		super();
		this.title = title;
		this.content = content;
		this.img = img;
		this.createdTime = createdTime;
		this.creator = creator;
		this.cata = cata;
		this.enabled = enabled;
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

	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}



}
