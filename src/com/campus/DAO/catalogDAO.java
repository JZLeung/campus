package com.campus.DAO;

import java.util.ArrayList;
import java.util.List;

import com.campus.Class.Catalog;
import com.campus.utils.dbutils;

public class catalogDAO {
	private static String clazz = "catalog";
	/**
	 * 获取所有分类信息
	 * @return
	 */
	public static List<List<Catalog>> getAllCatalog() {
		List<List<Catalog>> catalogList = new ArrayList<List<Catalog>>();
		Catalog parentNode = new Catalog();
		parentNode.setCID(0);
		List<Catalog> parentCatalogs = (List<Catalog>) dbutils.getAll(clazz, "getCatalogByParent", parentNode);
		for (Catalog parent : parentCatalogs) {
			List<Catalog> tmpList = new ArrayList<Catalog>();
			tmpList.add(parent);
			List<Catalog> childrens = getAllCatalogById(parent);
			for (Catalog catalog2 : childrens) {
				tmpList.add(catalog2);
			}
			catalogList.add(tmpList);
		}
		//System.out.println(catalogList);
		return catalogList;
	}
	/**
	 * 根据父CID获取子分类
	 * @param parentNode
	 * @return
	 */
	public static List<Catalog> getAllCatalogById(Catalog parentNode) {
		return (List<Catalog>) dbutils.getAll(clazz, "getCatalogByParent", parentNode);
	}
	
	public static Catalog getCatalogByCID(int CID) {
		return (Catalog) dbutils.getOne(clazz, "getCatalogByCid", CID);
	}
}	
