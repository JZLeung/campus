package com.campus.Actions;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.campus.Class.Address;
import com.campus.Class.Book;
import com.campus.Class.Order;
import com.campus.Class.User;
import com.campus.DAO.addressDAO;
import com.campus.DAO.bookDAO;
import com.campus.DAO.orderDAO;
import com.campus.DAO.userDAO;
import com.campus.utils.commonUtil;
import com.campus.utils.dbutils;

public class orderAction {
	private Order order;
	private Book book;
	private List<Address> addresses;
	private Address	address;
	private User user;
	private User saler;
	private int bid;
	private int oid;
	/**
	 * 买书操作
	 * @return
	 */
	public String buyBook() {
		order.setStarttime(new Timestamp(new Date().getTime()));
		order.setStatue(0);
		
		if (dbutils.insert("order", "addOrder", order) > -1) {
			oid = order.getOID();
		}
		//System.out.println(oid);
		return "ok";
	}
	/**
	 * 跳转至买书的页面
	 * @return
	 */
	public String toBuyBook() {
		user = (User) commonUtil.getSession("user");
		if (user == null) {
			return "error";
		}
		book = bookDAO.getBookById(bid);
		addresses = addressDAO.getAddressByUser(user);
		saler = userDAO.findUserById(book.getUID());
		return "ok";
	}
	/**
	 * 跳转至订单页面
	 * @return
	 */
	public String toOrder() {
		user = (User) commonUtil.getSession("user");
		if (user == null) {
			return "error";
		}
		order = orderDAO.getOrderByOID(oid);
		bid = order.getBID();
		book = bookDAO.getBookById(bid);
		saler = userDAO.findUserById(book.getUID());
		address = addressDAO.getAddByAID(order.getAID());
		return "ok";
	}
	/**
	 * 查询该书是否已售出
	 */
	public void isCanBuy() {
		int st = 1;
		if (!commonUtil.isLogin()) {
			st = -1;
		}else if (orderDAO.isInOrder(bid) == 1) {
			st = 0;
		}
		commonUtil.print(st);
	}
	/**
	 * 取消订单/确认收货
	 */
	public void changeOrder() {
		//System.out.println(order);
		commonUtil.print(orderDAO.updateOrder(order));
	}
	
	public User getSaler() {
		return saler;
	}

	public void setSaler(User saler) {
		this.saler = saler;
	}
	
	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public int getOid() {
		return oid;
	}
	
	public void setOid(int oid) {
		this.oid = oid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Book getBook() {
		return book;
	}
	
	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
}
