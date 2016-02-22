package com.campus.Class;

public class Hotsell {
	int HID;
	String title;
	String content;
	String url;
	String img;
	
	public int getHID() {
		return HID;
	}
	public void setHID(int hID) {
		HID = hID;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String toString() {
		return this.HID+":"+this.title+","+this.content+","+this.url+","+this.img;
	}
}
