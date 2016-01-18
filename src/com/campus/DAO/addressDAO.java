package com.campus.DAO;

import java.util.List;

import com.campus.Class.Address;
import com.campus.Class.User;
import com.campus.utils.dbutils;

public class addressDAO {
	static String clazz = "address";
	/**
	 * 获取一个用户的所有地址
	 * @param user
	 * @return
	 */
	public static List<Address> getAddressByUser(User user) {
		return (List<Address>) dbutils.getAll(clazz, "getAllAddresssByUID", user);
	}
	/**
	 * 添加地址
	 * @param address
	 * @return
	 */
	public static int addAdd(Address address) {
		return dbutils.insert(clazz, "addAddress", address);
	}
	/**
	 * 更新地址的数据
	 * @param address
	 * @return
	 */
	public static int updateAdd(Address address) {
		return dbutils.update(clazz, "updateAddress", address);
	}
	
	public static int delAdd(Address address) {
		return dbutils.delete(clazz, "deleteAddress", address);
	}
}
