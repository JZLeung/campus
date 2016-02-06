package com.campus.Admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.campus.Class.Book;
import com.campus.Class.Order;
import com.campus.Class.User;
import com.campus.DAO.bookDAO;
import com.campus.DAO.orderDAO;
import com.campus.DAO.userDAO;
import com.campus.utils.commonUtil;

public class index {
	private User adminUser;
	private int[] counts = new int[3];
	private int[] news = new int[3];
	
	/**
	 * 跳转至登录页面
	 * @return
	 */
	public String toLogin() {
		return "ok";
	}
	/**
	 * 后台登录
	 */
	public void login() {
		User user = userDAO.login(adminUser);
		Map<String, String> map = new HashMap<String, String>();
		if (user != null) {
			commonUtil.setSession("admin", user);
			map.put("code", 1+"");
			map.put("msg", "登录成功");
		}else{
			map.put("code", 0+"");
			map.put("msg", "登录失败，请检查用户名/密码是否正确");
		}
		commonUtil.print(new JSONObject(map).toString());
	}
	/**
	 * 后台管理主页面
	 * @return
	 */
	public String execute() {
		if(commonUtil.getSession("admin") == null){
			return "login";
		}
		List<User> allUsers = userDAO.getAllUsers();
		commonUtil.setSession("allUsers", allUsers);
		counts[0] = allUsers.size();
		
		List<Book> allBooks = bookDAO.getAllBooks();
		commonUtil.setSession("allBooks", allBooks);
		counts[1] = allBooks.size();
		
		List<Order> allOrders = orderDAO.getAllOrders();
		commonUtil.setSession("allOrders", allOrders);
		counts[2] = allOrders.size();
		
		/*int u = userDAO.countUsers(),
			b = bookDAO.countBooks(),
			o = orderDAO.countOrders();
		counts[0] = u;
		counts[1] = b;
		counts[2] = o;
		System.out.println(u+" "+b+" "+o);*/
		String start = commonUtil.getTime(-7);
		
		//List<Book> users = (List<Book>) commonUtil.getPages(bookDAO.getAllBooks(), 1, 10);
		List<User> newUsers = userDAO.getNewUsers(start,"");
		commonUtil.setSession("newUsers", newUsers);
		news[0] = newUsers.size();
		
		List<Book> newBooks = bookDAO.getNewBooks(start,"");
		commonUtil.setSession("newBooks", newBooks);
		news[1] = newBooks.size();
		
		List<Order> newOrders = orderDAO.getNewOrders(start, "");
		commonUtil.setSession("newOrders", newOrders);
		news[2] = newOrders.size();
		
		System.out.println(start);
		return "ok";
	}
	
	public int[] getCounts() {
		return counts;
	}

	public void setCounts(int[] counts) {
		this.counts = counts;
	}

	public User getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(User adminUser) {
		this.adminUser = adminUser;
	}

	public int[] getNews() {
		return news;
	}

	public void setNews(int[] news) {
		this.news = news;
	}
	
}
