package com.campus.Admin;

import java.util.List;

import com.campus.Class.User;
import com.campus.DAO.userDAO;
import com.campus.utils.commonUtil;

public class users {
	private List<User> allUsers;
	private List<User> newUsers;
	private String hash;
	
	public String execute() {
		if(commonUtil.getSession("admin") == null){
			return "login";
		}
		allUsers = (List<User>) commonUtil.getSession("allUsers");
		if(allUsers == null){
			allUsers = userDAO.getAllUsers();
			commonUtil.setSession("allUsers", allUsers);
		}
		
		newUsers = (List<User>) commonUtil.getSession("newUsers");
		if(newUsers == null){
			String start = commonUtil.getTime(-7);
			newUsers = userDAO.getNewUsers(start,"");
			commonUtil.setSession("newUsers", newUsers);
		}
		if (hash == null || hash.equals("")) {
			hash = "users";
		}
		//System.err.println(newUsers);
		//System.out.println(allUsers);
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
	
}
