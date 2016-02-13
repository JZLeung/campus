package com.campus.Admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import com.campus.Class.Book;
import com.campus.Class.Order;
import com.campus.Class.User;
import com.campus.DAO.orderDAO;
import com.campus.utils.commonUtil;

public class orders {
	private List<Order> allOrders;
	private List<User> allPulishers;
	private List<User> allCustomers;
	private List<Book> allBooks;
	
	private List<Order> newOrders;
	private List<User> newPulishers;
	private List<User> newCustomers;
	private List<Book> newBooks;
	
	private String hash;
	
	@SuppressWarnings("unchecked")
	public String execute() {
		if(commonUtil.getSession("admin") == null){
			return "login";
		}
		/*获取订单*/
		getOrders();
		/*获取发布者消息*/
		
		/*获取购买者*/
		
		/*获取书本*/
		
		
		if (hash == null || hash.equals("")) {
			hash = "Orders";
		}
		//System.err.println(newOrders);
		//System.out.println(allOrders);
		return "ok";
	}
	
	public void getPublishers() {
		getOrders();
		/*allPulishers = (List<User>) commonUtil.getSession("allPulishers");
		if(allPulishers == null){*/
			allPulishers = orderDAO.getUsersByOrders(allOrders);
			//commonUtil.setSession("allPulishers", allPulishers);
		/*}
		
		newPulishers = (List<User>) commonUtil.getSession("newPulishers");
		if(newPulishers == null){*/
			newPulishers = orderDAO.getUsersByOrders(newOrders);
			//commonUtil.setSession("newPulishers", newPulishers);
		//}
		Map<String, List<User>> map = new HashMap<String, List<User>>();
		map.put("all", allPulishers);
		map.put("new", newPulishers);
		commonUtil.print(new JSONObject(map));
	}
	
	public void getCustomers() {
		getOrders();
		/*allCustomers = (List<User>) commonUtil.getSession("allCustomers");
		if(allCustomers == null){*/
			allCustomers = orderDAO.getBuyerByOrders(allOrders);
			//commonUtil.setSession("allCustomers", allCustomers);
		/*}
		
		newCustomers = (List<User>) commonUtil.getSession("newCustomers");
		if(newCustomers == null){*/
			newCustomers = orderDAO.getBuyerByOrders(newOrders);
			//commonUtil.setSession("newCustomers", newCustomers);
		//}
		Map<String, List<User>> map = new HashMap<String, List<User>>();
		map.put("all", allCustomers);
		map.put("new", newCustomers);
		commonUtil.print(new JSONObject(map));
	}
	
	public void getBooks() {
		getOrders();
		/*allBooks = (List<Book>) commonUtil.getSession("allBooks");
		if(allBooks == null){*/
			allBooks = orderDAO.getBooksByOrders(allOrders);
			//commonUtil.setSession("allBooks", allBooks);
		/*}
		
		newBooks = (List<Book>) commonUtil.getSession("newBooks");
		if(newBooks == null){*/
			newBooks = orderDAO.getBooksByOrders(newOrders);
			//commonUtil.setSession("newBooks", newBooks);
		//}
		Map<String, List<Book>> map = new HashMap<String, List<Book>>();
		map.put("all", allBooks);
		map.put("new", newBooks);
		commonUtil.print(new JSONObject(map));
	}
	
	public void getOrders() {
		this.allOrders = (List<Order>) commonUtil.getSession("allOrders");
		if(this.allOrders == null){
			this.allOrders = orderDAO.getAllOrders();
			commonUtil.setSession("allOrders", this.allOrders);
		}
		
		this.newOrders = (List<Order>) commonUtil.getSession("newOrders");
		if(this.newOrders == null){
			String start = commonUtil.getTime(-7);
			this.newOrders = orderDAO.getNewOrders(start,"");
			commonUtil.setSession("newOrders", this.newOrders);
		}
		//System.out.println(allOrders);
		//System.out.println(newOrders);
	}
	
	public List<Order> getAllOrders() {
		return allOrders;
	}

	public void setAllOrders(List<Order> allOrders) {
		this.allOrders = allOrders;
	}

	public List<Order> getNewOrders() {
		return newOrders;
	}

	public void setNewOrders(List<Order> newOrders) {
		this.newOrders = newOrders;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public List<User> getAllPulishers() {
		return allPulishers;
	}

	public void setAllPulishers(List<User> allPulishers) {
		this.allPulishers = allPulishers;
	}

	public List<User> getAllCustomers() {
		return allCustomers;
	}

	public void setAllCustomers(List<User> allCustomers) {
		this.allCustomers = allCustomers;
	}

	public List<Book> getAllBooks() {
		return allBooks;
	}

	public void setAllBooks(List<Book> allBooks) {
		this.allBooks = allBooks;
	}

	public List<User> getNewPulishers() {
		return newPulishers;
	}

	public void setNewPulishers(List<User> newPulishers) {
		this.newPulishers = newPulishers;
	}

	public List<User> getNewCustomers() {
		return newCustomers;
	}

	public void setNewCustomers(List<User> newCustomers) {
		this.newCustomers = newCustomers;
	}

	public List<Book> getNewBooks() {
		return newBooks;
	}

	public void setNewBooks(List<Book> newBooks) {
		this.newBooks = newBooks;
	}
	
}
