package com.campus.Admin;

import java.util.List;

import com.campus.Class.Book;
import com.campus.DAO.bookDAO;
import com.campus.utils.commonUtil;

public class books {
	private List<Book> allBooks;
	private List<Book> newBooks;
	private String hash;
	
	public String execute() {
		if(commonUtil.getSession("admin") == null){
			return "login";
		}
		allBooks = (List<Book>) commonUtil.getSession("allBooks");
		if(allBooks == null){
			allBooks = bookDAO.getAllBooks();
			commonUtil.setSession("allBooks", allBooks);
		}
		
		newBooks = (List<Book>) commonUtil.getSession("newBooks");
		if(newBooks == null){
			String start = commonUtil.getTime(-7);
			newBooks = bookDAO.getNewBooks(start,"");
			commonUtil.setSession("newBooks", newBooks);
		}
		if (hash == null || hash.equals("")) {
			hash = "Books";
		}
		//System.err.println(newBooks);
		//System.out.println(allBooks);
		return "ok";
	}

	public List<Book> getAllBooks() {
		return allBooks;
	}

	public void setAllBooks(List<Book> allBooks) {
		this.allBooks = allBooks;
	}

	public List<Book> getNewBooks() {
		return newBooks;
	}

	public void setNewBooks(List<Book> newBooks) {
		this.newBooks = newBooks;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}
	
}
