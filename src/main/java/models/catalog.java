package models;

public class catalog {
private int id;
private String catalogname;

public catalog() {
	
}
public catalog(int id, String catalogname) {
	super();
	this.id = id;
	this.catalogname = catalogname;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getCatalogname() {
	return catalogname;
}
public void setCatalogname(String catalogname) {
	this.catalogname = catalogname;
}

}
