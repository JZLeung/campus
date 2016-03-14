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
	
	private int page1;
	private int page2;
	private int allPage1;
	private int allPage2;
	private int pageCount = 5;
	
	private String hash;
	
	@SuppressWarnings("unchecked")
	public String execute() {
		if(commonUtil.getSession("admin") == null){
			return "login";
		}
		/*获取订单*/
		getOrders();
		if (hash == null || hash.equals("")) {
			hash = "Orders";
		}
		return "ok";
	}
	
	@SuppressWarnings("unchecked")
	public void getPublishers() {
		getOrders();
		allPulishers = (List<User>) commonUtil.getPages(orderDAO.getUsersByOrders(this.allOrders), this.page1, pageCount);
		newPulishers = (List<User>) commonUtil.getPages(orderDAO.getUsersByOrders(this.newOrders), this.page2, pageCount);
		Map<String, List<User>> map = new HashMap<String, List<User>>();
		map.put("all", allPulishers);
		map.put("new", newPulishers);
		commonUtil.print(new JSONObject(map));
	}
	
	@SuppressWarnings("unchecked")
	public void getCustomers() {
		getOrders();
		allCustomers = (List<User>) commonUtil.getPages(orderDAO.getBuyerByOrders(this.allOrders), this.page1, pageCount);
		newCustomers = (List<User>) commonUtil.getPages(orderDAO.getBuyerByOrders(this.newOrders), this.page2, pageCount);
		Map<String, List<User>> map = new HashMap<String, List<User>>();
		map.put("all", allCustomers);
		map.put("new", newCustomers);
		commonUtil.print(new JSONObject(map));
	}
	
	@SuppressWarnings("unchecked")
	public void getBooks() {
		getOrders();
		allBooks = (List<Book>) commonUtil.getPages(orderDAO.getBooksByOrders(this.allOrders), this.page1, pageCount);
		newBooks = (List<Book>) commonUtil.getPages(orderDAO.getBooksByOrders(this.newOrders), this.page2, pageCount);
		Map<String, List<Book>> map = new HashMap<String, List<Book>>();
		map.put("all", allBooks);
		map.put("new", newBooks);
		commonUtil.print(new JSONObject(map));
	}
	@SuppressWarnings("unchecked")
	public void getOrders() {
		List<Order> allOrders1;// = (List<Order>) commonUtil.getSession("allOrders");
		//if(allOrders1 == null){
			allOrders1 = orderDAO.getAllOrders();
			commonUtil.setSession("allOrders", allOrders1);
		//}
		this.allPage1 = allOrders1.size();
		if (this.page1 * pageCount > this.allPage1) {
			this.page1 = 0;
		}
		this.allOrders = (List<Order>) commonUtil.getPages(allOrders1, this.page1, pageCount);
		
		
		
		List<Order> newOrders1;// = (List<Order>) commonUtil.getSession("newOrders");
		//if(newOrders1 == null){
			String start = commonUtil.getTime(-7);
			newOrders1 = orderDAO.getNewOrders(start,"");
			commonUtil.setSession("newOrders", newOrders1);
		//}
		this.allPage2 = newOrders1.size();
		if (this.page2 * pageCount > this.allPage2) {
			this.page2 = 0;
		}
		this.newOrders = (List<Order>) commonUtil.getPages(newOrders1, this.page2, pageCount);
		System.out.println(page1+"-:-"+page2);
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
