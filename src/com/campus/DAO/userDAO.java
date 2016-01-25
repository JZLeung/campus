package com.campus.DAO;

import com.campus.Class.User;
import com.campus.utils.dbutils;

public class userDAO {
	private static String clazz = "user";
	public static User findUserByName(String username) {
		User user = new User();
		user.setUsername(username);
		return (User) dbutils.getOne(clazz, "getUserByName", user);
	}
	
	public static User findUserById(int uid) {
		User user = new User();
		user.setUID(uid);
		return (User) dbutils.getOne(clazz, "getUserById", user);
	}
	
	public static User login(User loginUser) {
		User user = findUserByName(loginUser.getUsername());
		if (user == null) {return null;}
		return user.getPassword().equals(loginUser.getPassword()) ? user : null;
	}
	
	public static int regist(User registUser) {
		if (findUserByName(registUser.getUsername()) != null) {
			return 0;
		}
		return dbutils.insert(clazz, "addUser", registUser);
	}
	
	public static int update(User updateUser) {
		return dbutils.insert(clazz, "updateUser", updateUser);
	}
}
