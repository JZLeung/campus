package com.campus.Admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.campus.Class.Book;
import com.campus.Class.User;
import com.campus.DAO.bookDAO;
import com.campus.DAO.orderDAO;
import com.campus.DAO.userDAO;
import com.campus.utils.commonUtil;

public class index {
	private User adminUser;
	private int[] counts = new int[3];
	
	
	public String toLogin() {
		return "ok";
	}
	
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
	
	public String execute() {
		if(commonUtil.getSession("admin") == null){
			return "login";
		}
		int u = userDAO.countUsers(),
			b = bookDAO.countBooks(),
			o = orderDAO.countOrders();
		counts[0] = u;
		counts[1] = b;
		counts[2] = o;
		System.out.println(u+" "+b+" "+o);
		String start = commonUtil.getTime(-20);
		
		//List<Book> users = (List<Book>) commonUtil.getPages(bookDAO.getAllBooks(), 1, 10);
		List<User> users = userDAO.getNewUsers(start,"");
		List<Book> books = bookDAO.getNewBooks(start,"");
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
	
}
