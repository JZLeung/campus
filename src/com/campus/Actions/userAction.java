package com.campus.Actions;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import com.campus.Class.Address;
import com.campus.Class.Book;
import com.campus.Class.Order;
import com.campus.Class.User;
import com.campus.DAO.addressDAO;
import com.campus.DAO.bookDAO;
import com.campus.DAO.collectDAO;
import com.campus.DAO.orderDAO;
import com.campus.DAO.userDAO;
import com.campus.utils.commonUtil;

public class userAction {
	private User user;
	private User addUser;
	private User delUser;
	private User updateUser;
	private String newPass;
	private List<Address> addresses;
	private List<Book> books;
	private List<Order> orders;
	
	private String json_pulishers;
	private String json_books;
	private String json_addresses;
	
	/**
	 * 登录
	 */
	public void login() {
		//System.out.println(user);
		User loginedUser = userDAO.login(user);
		if (loginedUser != null) {
			System.out.println("before:"+loginedUser.getRegisttime());
			loginedUser.setLastlogin(new Timestamp(new Date().getTime()));
			System.out.println("after:"+loginedUser.getRegisttime());
			userDAO.resetLogin(loginedUser);
			commonUtil.setSession("user", loginedUser);
			commonUtil.getPrintWriter().println("1");
		}else{
			commonUtil.getPrintWriter().println("0");
		}
	}
	/*
	 * 注册
	 */
	public void regist() {
		
		addUser.setRegisttime(new Timestamp(new Date().getTime()));
		System.out.println(addUser);
		int status = userDAO.regist(addUser);
		Map<String, String> msgMap = new HashMap<String, String>();
		if (status == 1) {
			msgMap.put("msg", "注册成功");
			msgMap.put("code", "1");
		}else if (status == 0) {
			msgMap.put("msg", "用户名已存在");
			msgMap.put("code", "0");
		}else{
			msgMap.put("msg", "内部错误，请在尝试一次");
			msgMap.put("code", "-1");
		}
		commonUtil.setSession("user", userDAO.findUserByName(addUser.getUsername()));
		commonUtil.print(new JSONObject(msgMap).toString());
	}
	/**
	 * 更新个人信息
	 */
	public void update() {
		user = (User) commonUtil.getSession("user");
		//System.out.println(updateUser);
		Map<String, String> msgMap = new HashMap<String, String>();
		if (user.getPassword().equals(updateUser.getPassword())) {
			System.out.println(newPass);
			if (!updateUser.getPassword().equals(newPass)) {
				
				updateUser.setPassword(newPass);
			}
			updateUser.setUID(user.getUID());
			int status = userDAO.update(updateUser);
			if (status > 0) {
				msgMap.put("msg", "修改成功");
				msgMap.put("code", "1");
				commonUtil.setSession("user", userDAO.findUserById(user.getUID()));
			}else{
				msgMap.put("msg", "修改失败，请重试");
				msgMap.put("code", "0");
			}
			
		}else{
			msgMap.put("msg", "原密码错误，请输入正确密码");
			msgMap.put("code", "0");
		}
		JSONObject jsonObject = new JSONObject(msgMap);
		//System.out.println(jsonObject.toString());
		commonUtil.getPrintWriter().println(jsonObject.toString());
	}
	
	public String myOrders() {
		user = (User) commonUtil.getSession("user");
		if (user == null) {
			return "login";
		}
		orders = orderDAO.getOrderByUID(user.getUID());
		json_pulishers = new JSONArray(orderDAO.getUsersByOrders(orders)).toString();
		json_books = new JSONArray(orderDAO.getBooksByOrders(orders)).toString();
		return "ok";
	}
	/**
	 * 查询一个用户卖出的订单
	 * @return
	 */
	public String mySales() {
		user = (User) commonUtil.getSession("user");
		if (user == null) {
			return "login";
		}
		orders = orderDAO.getOrderByUID2(user.getUID());
		json_pulishers = new JSONArray(orderDAO.getUsersByOrders(orders)).toString();
		json_books = new JSONArray(orderDAO.getBooksByOrders(orders)).toString();
		return "ok";
	}
	
	/**
	 * 退出登录
	 */
	public void logout() {
		commonUtil.setSession("user", null);
		commonUtil.getPrintWriter().print("1");
	}
	/**
	 * 进入个人中心
	 * @return 已登录则进入个人中心，未登录则跳至错误页面
	 */
	public String execute() {
		user = (User) commonUtil.getSession("user");
		if (user == null) {
			return "login";
		}else{
			addresses = addressDAO.getAddressByUser(user);
		}
		return "ok";
	}
	/**
	 * 获取所有的收藏
	 * @return
	 */
	public String getMyCollections() {
		books = collectDAO.getAllCollections();
		//System.out.println(books);
		return "ok";
	}
	/**
	 * 获取发布的所有商品
	 * @return
	 */
	public String getMyBooks() {
		books = bookDAO.getBooksByUID();
		return "ok";
	}
	
	
	
	public String getJson_pulishers() {
		return json_pulishers;
	}
	public void setJson_pulishers(String json_pulishers) {
		this.json_pulishers = json_pulishers;
	}
	
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	public String getJson_addresses() {
		return json_addresses;
	}
	public void setJson_addresses(String json_addresses) {
		this.json_addresses = json_addresses;
	}
	public String getJson_books() {
		return json_books;
	}
	public void setJson_books(String json_books) {
		this.json_books = json_books;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	public String getNewPass() {
		return newPass;
	}
	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}
	public List<Address> getAddresses() {
		return addresses;
	}
	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getAddUser() {
		return addUser;
	}
	public void setAddUser(User addUser) {
		this.addUser = addUser;
	}
	public User getDelUser() {
		return delUser;
	}
	public void setDelUser(User delUser) {
		this.delUser = delUser;
	}
	public User getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(User updateUser) {
		this.updateUser = updateUser;
	}
	
}
