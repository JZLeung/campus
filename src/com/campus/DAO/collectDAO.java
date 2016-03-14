package com.campus.DAO;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import com.campus.Class.Book;
import com.campus.Class.User;
import com.campus.utils.commonUtil;
import com.campus.utils.dbutils;

public class collectDAO {
	private static String clazz = "collect";
	/**
	 * 添加收藏至已登录用户--外部访问
	 * @param bid
	 * @return
	 */
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
			if (!isInCollect(bid, collect)) {
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
	/**
	 * 取消收藏--外部访问
	 * @param bid
	 * @return
	 */
	public static int rmCollection(int bid) {
		User user = (User) commonUtil.getSession("user");
		String collect = user.getCollection();
		if (isInCollect(bid, collect)) {
			System.out.println("取消收藏前："+collect);
			collect = removeCollects(bid, collect);
			System.out.println("取消收藏后："+collect);
			user.setCollection(collect);
			dbutils.update(clazz, "updateCollection", user);
			return 1;
		}else{
			return 0;
		}
		
	}
	/**
	 * 查询书本是否已收藏--执行
	 * @param bid
	 * @param collections
	 * @return
	 */
	private static boolean isInCollect(int bid, String collections) {
		List<String> collectList = new ArrayList<String>();
		collectList = Arrays.asList(collections.split(","));
		return collectList.contains(bid+"");
	}
	/**
	 * 该用户是否已经收藏书本--外部访问
	 * @param bid
	 * @return
	 */
	public static boolean isCollected(int bid) {
		User user = (User) commonUtil.getSession("user");
		if (user == null) {
			return false;
		}
		String collect = user.getCollection();
		if (collect == null || collect .equals("")) {
			return false;
		}
		return isInCollect(bid, collect);
	}
	/**
	 * 取消收藏---执行
	 * @param bid
	 * @param collect
	 * @return
	 */
	private static String removeCollects(int bid, String collect) {
		String result = "";
		List<String> collects = Arrays.asList(collect.split(","));
		Iterator<String> it = collects.iterator();
		while (it.hasNext()) {
			String string = it.next();
			if (!string.equals(bid+"")) {
				result += string+",";
			}
		}
		return result == "" ? "" : result.substring(0, result.length()-1);
	}
	
	public static List<Book> getAllCollections() {
		User user = (User) commonUtil.getSession("user");
		if (user == null) {
			return null;
		}
		String collections = user.getCollection();
		if (collections == null || collections.equals("")) {
			return null;
		}else{
			String[] collection = collections.split(",");
			List<Book> list = new ArrayList<Book>();
			for(String string : collection){
				list.add(bookDAO.getBookById(Integer.parseInt(string)));
			}
			return list;
		}
	}
}
