package com.campus.Actions;

import java.io.File;
import java.util.List;

import org.json.JSONArray;

import com.campus.Class.Book;
import com.campus.Class.Catalog;
import com.campus.Class.User;
import com.campus.DAO.bookDAO;
import com.campus.DAO.catalogDAO;
import com.campus.DAO.userDAO;
import com.campus.utils.commonUtil;

public class bookAction {
	private Book book;
	private User publisher;
	private int bid;
	private User user;
	private String catalogs;
	
	public String addBook() {
		System.out.println(book);
		int st = bookDAO.addBook(book);
		if (st > 0) {
			System.out.println(st);
			return "ok";
		}
		return "error";
		//return "ok";
	}
	
	public String redirectToAdd() {
		List<List<Catalog>> object = catalogDAO.getAllCatalog();
		catalogs = new JSONArray(object).toString();
		//System.out.println(catalogs);
		return "add";
	}
	
	
	public String execute() {
		book = bookDAO.getBookById(bid);
		System.out.println(book.getUID());
		publisher = userDAO.findUserById(book.getUID());
		System.out.println(publisher);
		return "ok";
	}
	
	
	public String getCatalogs() {
		return catalogs;
	}

	public void setCatalogs(String catalogs) {
		this.catalogs = catalogs;
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

	public void setBook(Book book) {
		this.book = book;
	}

	public User getPublisher() {
		return publisher;
	}

	public void setPublisher(User pulisher) {
		this.publisher = pulisher;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	
}
