package com.campus.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class commonUtil {
	/**
	 * 设置session
	 * @param sessionName
	 * @param object
	 */
	public static void setSession(String sessionName, Object object) {
		ActionContext actionContext = ActionContext.getContext();
		Map sessionMap = actionContext.getSession();
		sessionMap.put(sessionName, object);
	}
	/**
	 * 获取session
	 * @param sessionName
	 * @return
	 */
	public static Object getSession(String sessionName) {
		ActionContext actionContext = ActionContext.getContext();
		Map sessionMap = actionContext.getSession();
		return sessionMap.get(sessionName);
	}
	/**
	 * 
	 * @return
	 */
	public static PrintWriter getPrintWriter() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=utf-8");
		try {
			return response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public static void print(Object object) {
		getPrintWriter().print(object);
	}
	
	public static Map getAllParams() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Enumeration enu=request.getParameterNames();
		Map<String, String> map = new HashMap<String, String>();
		while(enu.hasMoreElements()){
			String paraName=(String)enu.nextElement();
			map.put(paraName, request.getParameter(paraName));
		}
		return map;
		
	}
	/**
	 * 检测是否已经登录
	 * @return 未登录返回false 登录返回true
	 */
	public static boolean isLogin() {
		return !(getSession("user") == null);
	}
	
	public static Object getPages(Object objects , int pageIndex , int pageCount) {
		if (!( objects instanceof java.util.List)) {
			return objects;
		}else{
			int start = pageIndex*pageCount;
			try {
				List<Object> list = (List<Object>) objects, result = new ArrayList<Object>();
				if (list.size() < start) {
					System.out.println("分页参数错误：分页数量不足");
					return objects;
				}else{
					for (int i = start; i < list.size(); i++) {
						result.add(list.get(i));
					}
					//System.out.println(result);
					return result;
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println("分页出错："+e);
				return null;
			}
		}
	}
	/**
	 * 获取一个搜索时间的时间段集合
	 * @param start
	 * @param end
	 * @return
	 */
	public static Map<String, String> getTimeMap(String start, String end) {
		Map<String, String> map = new HashMap<String, String>();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        map.put("start",start.equals("") ? "1970-1-1 00:00:00" : start);
        map.put("end",end.equals("") ? sf.format(c.getTime())+" 00:00:00" : end);
		System.out.println(map);
		return map;
	}
	/**
	 * 获取一个时间格式
	 * @param days
	 * @return
	 */
	public static String getTime(int days) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        if (days != 0) {
			c.add(Calendar.DAY_OF_MONTH, days);
		}
        return sf.format(c.getTime());
	}
	
	public static String getNowTime() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		return df.format(new Date());
		
	}
}
