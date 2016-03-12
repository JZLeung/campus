package com.campus.Actions;

import java.util.List;

import org.json.JSONArray;

import com.campus.Class.Book;
import com.campus.Class.Catalog;
import com.campus.Class.User;
import com.campus.DAO.bookDAO;
import com.campus.DAO.catalogDAO;
import com.campus.DAO.collectDAO;
import com.campus.DAO.orderDAO;
import com.campus.DAO.userDAO;
import com.campus.utils.commonUtil;

public class bookAction {
	private Book book;
	private Book edit;
	private User publisher;
	private int bid;
	private int cid;
	private User user;
	private String catalogs;
	private boolean collected;
	private int statue;
	private String error;
	private Catalog parentCatalog;
	private Catalog childCatalog;
	
	private int page;
	private int allPages;
	
	private List<Book> bookList;
	private List<List<Catalog>> catalogList;
	/**
	 * 新增商品（卖书）
	 * @return
	 */
	public String addBook() {
		System.out.println(book);
		int st = bookDAO.addBook(book);
		if (st > 0) {
			System.out.println(st);
			System.out.println(book);
			bid = book.getBID();
			return "ok";
		}
		return "error";
		//return "ok";
	}
	/**
	 * 跳转到卖书页面
	 * @return
	 */
	public String redirectToAdd() {
		if (!commonUtil.isLogin()) {
			return "error";
		}
		List<List<Catalog>> object = catalogDAO.getAllCatalog();
		catalogs = new JSONArray(object).toString();
		//System.out.println(catalogs);
		return "add";
	}
	/**
	 * 查看商品相信
	 * @return
	 */
	public String execute() {
		System.out.println(bid);
		book = bookDAO.getBookById(bid);
		if (book == null) {
			return "error";
		}
		publisher = userDAO.findUserById(book.getUID());
		childCatalog = catalogDAO.getCatalogByCID(book.getCID());
		parentCatalog = catalogDAO.getCatalogByCID(childCatalog.getParent());
		collected = collectDAO.isCollected(bid);
		statue = orderDAO.isInOrder(bid);
		System.out.println(statue);
		
		
		
		
		return "ok";
	}
	/**
	 * 跳转到相对应分类下的页面
	 * @return
	 */
	public String getBooksByCID() {
		bookList = bookDAO.getBooksByCID(cid);
		catalogList = catalogDAO.getAllCatalog();
		allPages = bookList.size();
		int pageCount = 8;
		bookList = (List<Book>) commonUtil.getPages(bookList, page, pageCount);
		
		return "ok";
	}
	/**
	 * 跳转至编辑页面
	 * @return
	 */
	public String redirectToEdit() {
		if (!commonUtil.isLogin()) {
			error = "请先登录后再进行操作。<a href='/jsp/user/login.jsp'>登录</a>";
			return "error";
		}
		book = bookDAO.getBookById(bid);
		if (book == null) {
			error = "该书不存在，请重试";
			return "error";
		}
		if (book.getUID() != ((User)commonUtil.getSession("user")).getUID()) {
			error = "你不是发布该商品的发布者，请重试";
			return "error";
		}
		List<List<Catalog>> object = catalogDAO.getAllCatalog();
		catalogs = new JSONArray(object).toString();
		//System.out.println(catalogs);
		return "edit";
	}
	/**
	 * 编辑书
	 * @return
	 */
	public String editBook() {
		System.out.println(edit);
		bid = edit.getBID();
		int st = bookDAO.updateBook(edit);
		System.out.println(st);
		if (st > 0) {
			return "ok";
			
		}
		error = "更新出错";
		return "error";
	}
	
	public void deleteBook() {
		System.out.println("You have deleted the book : BID => "+bid);
		commonUtil.print(bookDAO.delBook(bid));
	}
	
	public boolean isCollected() {
		return collected;
	}

	public void setCollected(boolean collected) {
		this.collected = collected;
	}
	
	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public Book getEdit() {
		return edit;
	}

	public void setEdit(Book edit) {
		this.edit = edit;
	}

	public List<Book> getBookList() {
		return bookList;
	}

	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}

	public List<List<Catalog>> getCatalogList() {
		return catalogList;
	}

	public void setCatalogList(List<List<Catalog>> catalogList) {
		this.catalogList = catalogList;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getStatue() {
		return statue;
	}

	public void setStatue(int statue) {
		this.statue = statue;
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
	
	public Catalog getChildCatalog() {
		return childCatalog;
	}
	public void setChildCatalog(Catalog childCatalog) {
		this.childCatalog = childCatalog;
	}
	
	public Catalog getParentCatalog() {
		return parentCatalog;
	}
	public void setParentCatalog(Catalog parentCatalog) {
		this.parentCatalog = parentCatalog;
	}
	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getAllPages() {
		return allPages;
	}
	public void setAllPages(int allPages) {
		this.allPages = allPages;
	}

	
}
