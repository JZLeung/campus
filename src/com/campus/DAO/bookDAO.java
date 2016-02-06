package com.campus.DAO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.campus.Class.Book;
import com.campus.Class.User;
import com.campus.utils.commonUtil;
import com.campus.utils.dbutils;

public class bookDAO {
	
	private static String clazz = "book";
	private static String time;
	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	/**
	 * 获取所有的书本
	 * @return
	 */
	public static List<Book> getAllBooks() {
		return (List<Book>) dbutils.getAll(clazz, "getAllBooks");
	}
	/**
	 * 通过书的id获取具体某一本书
	 * @param bID
	 * @return
	 */
	public static Book getBookById(int bID) {
		Book book = new Book();
		book.setBID(bID);
		return (Book) dbutils.getOne(clazz, "getBookById", book);
	}
	/**
	 * 添加新的书
	 * @param book
	 * @return
	 */
	public static int addBook(Book book) {
		User user = (User) commonUtil.getSession("user");
		book.setUID(user.getUID());
		time = df.format(new Date().getTime());
		book.setPublishtime(Timestamp.valueOf(time));
		return dbutils.insert(clazz, "addBook", book);
	}
	/**
	 * 获取用户发布的所有书
	 * @return
	 */
	public static List<Book> getBooksByUID() {
		User user = (User) commonUtil.getSession("user");
		return (List<Book>) dbutils.getAll(clazz, "getBookByUId", user);
	}
	/**
	 * 根据分类查找书本
	 * @param cid
	 * @return
	 */
	public static List<Book> getBooksByCID(int cid) {
		return (List<Book>) dbutils.getAll(clazz, "getBookByCId", cid);
	}
	/**
	 * 更新书本
	 * @param book
	 * @return
	 */
	public static int updateBook(Book book) {
		return dbutils.update(clazz, "updateBook", book);
	}
	/**
	 * 获取书的数目
	 * @return
	 */
	public static int countBooks() {
		return (Integer) dbutils.getOne(clazz, "count");
	}
	/**
	 * 获取一周内新上架的书本
	 * @param start
	 * @param end
	 * @return
	 */
	public static List<Book> getNewBooks(String start, String end) {
		Map<String, String> map = commonUtil.getTimeMap(start, end);
		return (List<Book>) dbutils.getAll(clazz, "getNewBook", map);
	}
}
