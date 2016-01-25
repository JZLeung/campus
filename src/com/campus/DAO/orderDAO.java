package com.campus.DAO;

import com.campus.Class.Order;
import com.campus.utils.dbutils;

public class orderDAO {
	private static String clazz = "order";
	/**
	 * 查询书本是否已被售出
	 * @param bid
	 * @return 未出售则返回0，否则返回1
	 */
	public static int isInOrder(int bid) {
		Object object = dbutils.getOne(clazz, "getOrderByBId", bid);
		if (object == null) {
			return 0;
		}else {
			return 1;
		}
	}
	/**
	 * 获取某个订单的信息
	 * @param oid
	 * @return
	 */
	public static Order getOrderByOID(int oid) {
		//Order order = new Order();
		//order.setOID(oid);
		return (Order) dbutils.getOne(clazz, "getOrderByOID", oid);
	}
}
