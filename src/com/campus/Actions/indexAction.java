package com.campus.Actions;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.campus.Class.Book;
import com.campus.Class.Catalog;
import com.campus.DAO.bookDAO;
import com.campus.DAO.catalogDAO;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class indexAction {
	
	List<List<Catalog>> catalogList = new ArrayList<List<Catalog>>();
	List<Book> bookList = new ArrayList<Book>();
	
	public List<List<Catalog>> getCatalogList() {
		return catalogList;
	}
	public void setCatalogList(List<List<Catalog>> catalogList) {
		this.catalogList = catalogList;
	}
	public List<Book> getBookList() {
		return bookList;
	}
	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}
	/**
	 * 跳转首页
	 * @return
	 */
	public String execute() {
		catalogList = catalogDAO.getAllCatalog();
		bookList = bookDAO.getAllBooks();
		
		//System.out.println(new JSONArray(catalogList).toString());
		/*System.out.println(bookList);*/
		return "ok";
	}
}
