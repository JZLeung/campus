package com.campus.Admin;

import java.util.List;

import com.campus.Class.Order;
import com.campus.DAO.orderDAO;
import com.campus.utils.commonUtil;

public class orders {
	private List<Order> allOrders;
	private List<Order> newOrders;
	private String hash;
	
	public String execute() {
		if(commonUtil.getSession("admin") == null){
			return "login";
		}
		allOrders = (List<Order>) commonUtil.getSession("allOrders");
		if(allOrders == null){
			allOrders = orderDAO.getAllOrders();
			commonUtil.setSession("allOrders", allOrders);
		}
		
		newOrders = (List<Order>) commonUtil.getSession("newOrders");
		if(newOrders == null){
			String start = commonUtil.getTime(-7);
			newOrders = orderDAO.getNewOrders(start,"");
			commonUtil.setSession("newOrders", newOrders);
		}
		if (hash == null || hash.equals("")) {
			hash = "Orders";
		}
		//System.err.println(newOrders);
		//System.out.println(allOrders);
		return "ok";
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
	
}
