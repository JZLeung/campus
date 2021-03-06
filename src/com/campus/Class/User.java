package com.campus.Class;

import java.sql.Timestamp;

public class User {
	String username;
	int UID;
	String password;
	String email;
	int isactive;
	Timestamp registtime;
	Timestamp lastlogin;
	String collection;
	String address;
	String portrail;
	String phone;
	int usertype;
	
	public int getUsertype() {
		return usertype;
	}
	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPortrail() {
		return portrail;
	}
	public void setPortrail(String portrail) {
		this.portrail = portrail;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getUID() {
		return UID;
	}
	public void setUID(int uID) {
		UID = uID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getIsactive() {
		return isactive;
	}
	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}
	public Timestamp getRegisttime() {
		return registtime;
	}
	public void setRegisttime(Timestamp registtime) {
		this.registtime = registtime;
		this.lastlogin = registtime;
	}
	public Timestamp getLastlogin() {
		return lastlogin;
	}
	public void setLastlogin(Timestamp lastlogin) {
		this.lastlogin = lastlogin;
	}
	public String getCollection() {
		return collection;
	}
	public void setCollection(String collection) {
		this.collection = collection;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String toString() {
		return this.UID+":"+this.getUsername()+","+this.phone+","+this.email+",lastlogin:"+this.lastlogin+",password:"+this.password;
	}
	
}
