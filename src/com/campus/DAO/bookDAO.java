package com.campus.DAO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.campus.Class.Book;
import com.campus.Class.User;
import com.campus.utils.commonUtil;
import com.campus.utils.dbutils;

public class bookDAO {
	
	private static String clazz = "book";
	private static String time;
	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static List<Book> getAllBooks() {
		return (List<Book>) dbutils.getAll(clazz, "getAllBooks");
	}
	
	public static Book getBookById(int bID) {
		Book book = new Book();
		book.setBID(bID);
		return (Book) dbutils.getOne(clazz, "getBookById", book);
	}
	
	public static int addBook(Book book) {
		User user = (User) commonUtil.getSession("user");
		book.setUID(user.getUID());
		time = df.format(new Date().getTime());
		book.setPublishtime(Timestamp.valueOf(time));
		return dbutils.insert(clazz, "addBook", book);
	}
	
}
