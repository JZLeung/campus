package com.campus.Admin;

import java.util.List;

import com.campus.Class.Book;
import com.campus.DAO.bookDAO;
import com.campus.utils.commonUtil;

public class books {
	private List<Book> allBooks;
	private List<Book> newBooks;
	private String hash;
	private int page1;
	private int page2;
	private int allPage1;
	private int allPage2;
	private int pageCount = 5;
	
	public String execute() {
		if(commonUtil.getSession("admin") == null){
			return "login";
		}
		List<Book> allBooks2 = (List<Book>) commonUtil.getSession("allBooks");
		if(allBooks2 == null){
			allBooks2 = bookDAO.getAllBooks();
			commonUtil.setSession("allBooks", allBooks2);
		}
		this.allPage1 = allBooks2.size();
		if (page1 * pageCount > allPage1) {
			page1 = 0;
		}
		allBooks = (List<Book>) commonUtil.getPages(allBooks2, page1, pageCount);
		
		
		List<Book> newBooks2 = (List<Book>) commonUtil.getSession("newBooks");
		if(newBooks2 == null){
			String start = commonUtil.getTime(-7);
			newBooks2 = bookDAO.getNewBooks(start,"");
			commonUtil.setSession("newBooks", newBooks2);
		}
		this.allPage2 = newBooks2.size();
		if (page2 * pageCount > allPage2) {
			page2 = 0;
		}
		newBooks = (List<Book>) commonUtil.getPages(newBooks2, page2, pageCount);
		
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

	public int getPage1() {
		return page1;
	}

	public void setPage1(int page1) {
		this.page1 = page1;
	}

	public int getPage2() {
		return page2;
	}

	public void setPage2(int page2) {
		this.page2 = page2;
	}

	public int getAllPage1() {
		return allPage1;
	}

	public void setAllPage1(int allPage1) {
		this.allPage1 = allPage1;
	}

	public int getAllPage2() {
		return allPage2;
	}

	public void setAllPage2(int allPage2) {
		this.allPage2 = allPage2;
	}
	
}
