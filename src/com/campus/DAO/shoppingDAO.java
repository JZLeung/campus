package com.campus.DAO;

import com.campus.Class.User;
import com.campus.utils.commonUtil;
import com.campus.utils.dbutils;

public class shoppingDAO {
	private static String clazz = "collect";
	public static int addCollection(int bid) {
		User user = (User) commonUtil.getSession("user");
		String collect = user.getCollection();
		System.out.println("collect:"+collect);
		
		if (collect == null || collect.equals("")) {
			collect = bid+"";
			user.setCollection(collect);
			System.out.println(user);
			dbutils.update(clazz, "updateCollection", user);
			return 1;
		}else{
			if (collect.indexOf(bid) > -1) {
				collect =  collect+","+bid;
				user.setCollection(collect);
				System.out.println(user);
				dbutils.update(clazz, "updateCollection", user);
				return 1;
			}else {
				return 0;
			}
		}
		
	}
	
	public static int rmCollection(int bid) {
		User user = (User) commonUtil.getSession("user");
		String collect = user.getCollection();
		if (collect.indexOf(bid) > -1) {
			System.out.println("取消收藏前："+collect);
			collect = collect.replaceFirst(","+bid+",", collect);
			System.out.println("取消收藏后："+collect);
			user.setCollection(collect);
			dbutils.update(clazz, "updateCollection", user);
			return 1;
		}else{
			return 0;
		}
		
	}
	
}
