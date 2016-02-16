package com.campus.DAO;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.campus.Class.Book;
import com.campus.Class.Order;
import com.campus.Class.User;
import com.campus.utils.commonUtil;
import com.campus.utils.dbutils;

public class orderDAO {
	private static String clazz = "order";
	/**
	 * 查询书本是否已被售出
	 * @param bid
	 * @return 未出售则返回0，否则返回1
	 */
	public static int isInOrder(int bid) {
		Object object = dbutils.getOne(clazz, "getOrderByBId", bid);
		if (object == null) {
			return 0;
		}else {
			System.out.println(object);
			return 1;
		}
	}
	/**
	 * 获取某个订单的信息
	 * @param oid
	 * @return
	 */
	public static Order getOrderByOID(int oid) {
		//Order order = new Order();
		//order.setOID(oid);
		return (Order) dbutils.getOne(clazz, "getOrderByOID", oid);
	}
	/**
	 * 获取一个用户所有订单
	 * @param UID
	 * @return
	 */
	public static List<Order> getOrderByUID(int UID) {
		return (List<Order>) dbutils.getAll(clazz, "getOrderByUId", UID);
	}
	/**
	 * 获取一个用户所有订单
	 * @param UID
	 * @return
	 */
	public static List<Order> getOrderByUID2(int UID) {
		return (List<Order>) dbutils.getAll(clazz, "getOrderByUId2", UID);
	}
	/**
	 * 获取订单中的发布者的信息
	 * @param orders
	 * @return
	 */
	public static List<User> getUsersByOrders(List<Order> orders) {
		List<User> users = new ArrayList<User>();
		User user;
		for (Iterator iterator = orders.iterator(); iterator.hasNext();) {
			Order order = (Order) iterator.next();
			user = (User)dbutils.getOne("user", "getUserById", order.getUID2());
			user.setPassword("");
			users.add(user);
		}
		//System.out.println(users);
		return users;
	}
	/**
	 * 获取订单的购买者
	 * @param orders
	 * @return
	 */
	public static List<User> getBuyerByOrders(List<Order> orders) {
		List<User> users = new ArrayList<User>();
		User user;
		for (Iterator iterator = orders.iterator(); iterator.hasNext();) {
			Order order = (Order) iterator.next();
			user = (User)dbutils.getOne("user", "getUserById", order.getUID1());
			user.setPassword("");
			users.add(user);
		}
		//System.out.println(users);
		return users;
	}
	/**
	 * 根据一组订单号查出该订单的所有书本
	 * @param orders
	 * @return
	 */
	public static List<Book> getBooksByOrders(List<Order> orders) {
		List<Book> books = new ArrayList<Book>();
		for (Iterator iterator = orders.iterator(); iterator.hasNext();) {
			Order order = (Order) iterator.next();
			books.add((Book)dbutils.getOne("book", "getBookById", order.getBID()));
		}
		//System.out.println(books);
		return books;
	}
	
	public static int updateOrder(Order order) {
		return dbutils.update(clazz, "changeOrder", order);
	}
	
	public static int countOrders() {
		return (Integer) dbutils.getOne(clazz, "count");
	}
	
	public static List<Order> getNewOrders(String start, String end) {
		Map<String, String> map = commonUtil.getTimeMap(start, end);
		return (List<Order>) dbutils.getAll(clazz, "getNewOrders", map);
	}
	
	public static List<Order> getAllOrders() {
		return (List<Order>) dbutils.getAll(clazz, "getAllOrders");
	}
}
