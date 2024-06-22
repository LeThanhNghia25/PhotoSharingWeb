package models;

public class Comment {
    private int id;
    private String content;
    private Img img;

    public Comment() {
    }

    public Comment(int id, String content, Img img) {
        this.id = id;
        this.content = content;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Img getImg() {
        return img;
    }

    public void setImg(Img img) {
        this.img = img;
    }
}
