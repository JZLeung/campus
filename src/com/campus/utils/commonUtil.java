package com.campus.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
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
	
	public static boolean isLogin() {
		return !(getSession("user") == null);
	}
}
