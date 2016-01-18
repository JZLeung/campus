package com.campus.DAO;

import java.util.ArrayList;
import java.util.List;

import com.campus.Class.Catalog;
import com.campus.utils.dbutils;

public class catalogDAO {
	
	public static List<List<Catalog>> getAllCatalog() {
		List<List<Catalog>> catalogList = new ArrayList<List<Catalog>>();
		Catalog parentNode = new Catalog();
		parentNode.setCID(0);
		List<Catalog> parentCatalogs = (List<Catalog>) dbutils.getAll("catalog", "getCatalogByCId", parentNode);
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
	
	public static List<Catalog> getAllCatalogById(Catalog parentNode) {
		return (List<Catalog>) dbutils.getAll("catalog", "getCatalogByCId", parentNode);
	}
}	
