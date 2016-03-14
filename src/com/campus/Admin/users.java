package com.campus.Admin;

import java.util.List;

import com.campus.Class.User;
import com.campus.DAO.userDAO;
import com.campus.utils.commonUtil;

public class users {
	private List<User> allUsers;
	private List<User> newUsers;
	private String hash;
	private int page1;
	private int page2;
	private int allPage1;
	private int allPage2;
	private int pageCount = 5;
	
	@SuppressWarnings("unchecked")
	public String execute() {
		if(commonUtil.getSession("admin") == null){
			return "login";
		}
		List<User> allUsers1 = (List<User>) commonUtil.getSession("allUsers");
		if(allUsers1 == null){
			allUsers1 = userDAO.getAllUsers();
			commonUtil.setSession("allUsers", allUsers1);
		}
		this.allPage1 = allUsers1.size();
		if (page1 * pageCount > allPage1) {
			page1 = 0;
		}
		
		allUsers = (List<User>) commonUtil.getPages(allUsers1, page1, pageCount);
		System.out.println(allUsers);
		List<User> newUsers1 = (List<User>) commonUtil.getSession("newUsers");
		if(newUsers1 == null){
			String start = commonUtil.getTime(-7);
			newUsers1 = userDAO.getNewUsers(start,"");
			commonUtil.setSession("newUsers", newUsers1);
		}
		this.allPage2 = newUsers1.size();
		if (page2 * pageCount > allPage2) {
			page2 = 0;
		}
		
		newUsers = (List<User>) commonUtil.getPages(newUsers1, page2, pageCount);
		System.out.println(newUsers);
		if (hash == null || hash.equals("")) {
			hash = "users";
		}
		System.out.println(page1+":"+page2);
		System.out.println(allPage1+":"+allPage2);
		return "ok";
	}

	public List<User> getAllUsers() {
		return allUsers;
	}

	public void setAllUsers(List<User> allUsers) {
		this.allUsers = allUsers;
	}

	public List<User> getNewUsers() {
		return newUsers;
	}

	public void setNewUsers(List<User> newUsers) {
		this.newUsers = newUsers;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public int getPage1() {
		return page1;
	}

	public void setPage1(int page1) {
		this.page1 = page1;
	}

	public int getPage2() {
		return page2;
	}

	public void setPage2(int page2) {
		this.page2 = page2;
	}

	public int getAllPage1() {
		return allPage1;
	}

	public void setAllPage1(int allPage1) {
		this.allPage1 = allPage1;
	}

	public int getAllPage2() {
		return allPage2;
	}

	public void setAllPage2(int allPage2) {
		this.allPage2 = allPage2;
	}

	
}
