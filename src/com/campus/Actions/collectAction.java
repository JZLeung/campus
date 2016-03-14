package com.campus.Actions;

import com.campus.Class.User;
import com.campus.DAO.collectDAO;
import com.campus.utils.commonUtil;

public class collectAction {
	private int bid;
	private User user;
	
	static{
		System.out.println("我是static函数");
		
	}
	
	public void addCollection() {
		int st;
		System.out.println(bid);
		if (commonUtil.isLogin()) {
			System.out.println("已经登录，可以继续操作");
			st = collectDAO.addCollection(bid);
			commonUtil.print(st);
		}else{
			System.out.println("没有登录");
			commonUtil.print(-1);
		}
	}
	
	public void removeCollection() {
		int st;
		System.out.println(bid);
		if (commonUtil.isLogin()) {
			System.out.println("已经登录，可以继续操作");
			st = collectDAO.rmCollection(bid);
			commonUtil.print(st);
		}else{
			System.out.println("没有登录");
			commonUtil.print(-1);
		}
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
	
}
