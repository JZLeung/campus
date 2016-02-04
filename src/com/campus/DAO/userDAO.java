package com.campus.DAO;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.campus.Class.User;
import com.campus.utils.commonUtil;
import com.campus.utils.dbutils;

public class userDAO {
	private static String clazz = "user";
	/**
	 * 根据用户名查找用户
	 * @param username
	 * @return
	 */
	public static User findUserByName(String username) {
		User user = new User();
		user.setUsername(username);
		return (User) dbutils.getOne(clazz, "getUserByName", user);
	}
	/**
	 * 根据UID查找用户
	 * @param uid
	 * @return
	 */
	public static User findUserById(int uid) {
		User user = new User();
		user.setUID(uid);
		return (User) dbutils.getOne(clazz, "getUserById", user);
	}
	/**
	 * 登录
	 * @param loginUser
	 * @return 登录失败返回空，登录成功返回该用户
	 */
	public static User login(User loginUser) {
		User user = findUserByName(loginUser.getUsername());
		if (user == null) {return null;}
		return user.getPassword().equals(loginUser.getPassword()) ? user : null;
	}
	/**
	 * 用户注册
	 * @param registUser
	 * @return
	 */
	public static int regist(User registUser) {
		if (findUserByName(registUser.getUsername()) != null) {
			return 0;
		}
		return dbutils.insert(clazz, "addUser", registUser);
	}
	/**
	 * 更新用户信息
	 * @param updateUser
	 * @return
	 */
	public static int update(User updateUser) {
		return dbutils.insert(clazz, "updateUser", updateUser);
	}
	
	public static int countUsers() {
		return (Integer) dbutils.getOne(clazz, "count");
	}
	
	public static List<User> getAllUsers() {
		return (List<User>) dbutils.getAll(clazz, "getAllUser");
	}
	
	public static List<User> getNewUsers(String start, String end) {
		Map<String, String> map = commonUtil.getTimeMap(start, end);
		return (List<User>) dbutils.getAll(clazz, "getAllUser",map);
	}
}
