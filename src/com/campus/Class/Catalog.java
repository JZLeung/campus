package com.campus.Class;

public class Catalog {
	int CID;
	String name;
	int parent;
	public int getCID() {
		return CID;
	}
	public void setCID(int cID) {
		CID = cID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	
	public String toString() {
		return this.CID+","+this.name;
	}
}
