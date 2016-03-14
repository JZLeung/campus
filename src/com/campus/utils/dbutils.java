package com.campus.utils;

import org.apache.ibatis.session.SqlSession;

public class dbutils {
	
	private static SqlSession session = null;
	/**
	 * clazz 为类名
	 * method 为需要执行相对应的动作
	 */
	static{
		if (session == null) {
			session = MyBatisUtil.getSqlSession(true);
		}
	}
	/**
	 * 获取所有数据
	 * @param clazz
	 * @return
	 */
	public static Object getAll(String clazz, String method) {
		String mapper = "Mapper."+clazz+"Mapper."+method;
		Object object = session.selectList(mapper);
		return object;
	}
	/**
	 * 根据某个属性获取所有符合的数据
	 * @param clazz
	 * @param method
	 * @param param
	 * @return
	 */
	public static Object getAll(String clazz, String method, Object param) {
		String mapper = "Mapper."+clazz+"Mapper."+method;
		Object object = session.selectList(mapper, param);
		return object;
	}
	
	/**
	 * 获取一条数据
	 * @param clazz
	 * @param method
	 * @param params
	 * @return
	 */
	public static Object getOne(String clazz, String method, Object params) {
		String mapper = "Mapper."+clazz+"Mapper."+method;
		Object object = session.selectOne(mapper, params);
		return object;
	}
	
	public static Object getOne(String clazz, String method) {
		String mapper = "Mapper."+clazz+"Mapper."+method;
		Object object = session.selectOne(mapper);
		return object;
	}
	/**
	 * 更新数据
	 * @param clazz
	 * @param method
	 * @param params
	 * @return 
	 */
	public static int update(String clazz, String method, Object params) {
		String mapper = "Mapper."+clazz+"Mapper."+method;
		int st = session.update(mapper, params);
		session.clearCache();
		return st;
	}
	/**
	 * 删除数据
	 * @param clazz
	 * @param method
	 * @param params
	 * @return 
	 */
	public static int delete(String clazz, String method, Object params) {
		String mapper = "Mapper."+clazz+"Mapper."+method;
		return session.delete(mapper, params);
	}
	/**
	 * 插入一条数据
	 * @param clazz
	 * @param method
	 * @param params
	 * @return
	 */
	public static int insert(String clazz, String method, Object params) {
		String mapper = "Mapper."+clazz+"Mapper."+method;
		return session.insert(mapper, params);
	}
	/**
	 * 插入一条数据
	 * @param clazz
	 * @param method
	 * @param params
	 * @return
	 */
	public static int insertKey(String clazz, String method, Object params) {
		String mapper = "Mapper."+clazz+"Mapper."+method;
		return session.insert(mapper, params);
	}
}
