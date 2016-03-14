package com.campus.Actions;

import java.util.List;

import com.campus.Class.Book;
import com.campus.DAO.bookDAO;

public class searchAction {
	private String name;
	private List<Book> books;
	
	
	public String execute() {
		books = bookDAO.searchBooks(name);
		System.out.println(name);
		System.out.println(books);
		return "ok";
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	
}
