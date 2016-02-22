package com.campus.DAO;

import java.util.List;

import com.campus.Class.Hotsell;
import com.campus.utils.dbutils;

public class hotsellDAO {
	static String clazz = "hotsell";
	/**
	 * 获取所有热销产品
	 * @return
	 */
	public static List<Hotsell>	getAllHotsells() {
		return (List<Hotsell>) dbutils.getAll(clazz, "getAll");
	}
	/**
	 * 更新
	 * @param updateHotsell
	 * @return
	 */
	public static int update(Hotsell updateHotsell) {
		return dbutils.update(clazz, "update", updateHotsell);
	}
	/**
	 * 新增
	 * @param addHotsell
	 * @return
	 */
	public static int add(Hotsell addHotsell) {
		return dbutils.insert(clazz, "add", addHotsell);
	}
	/**
	 * 删除
	 * @param delHotsell
	 * @return
	 */
	public static int del(Hotsell delHotsell) {
		return dbutils.delete(clazz, "del", delHotsell);
	}
}
