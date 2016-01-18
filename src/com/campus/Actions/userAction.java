package com.campus.Actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.campus.Class.Address;
import com.campus.Class.User;
import com.campus.DAO.addressDAO;
import com.campus.DAO.userDAO;
import com.campus.utils.commonUtil;

public class userAction {
	private User user;
	private User addUser;
	private User delUser;
	private User updateUser;
	private String newPass;
	private List<Address> addresses;
	/**
	 * 登录
	 */
	public void login() {
		System.out.println(user);
		User loginedUser = userDAO.login(user);
		if (loginedUser != null) {
			commonUtil.setSession("user", loginedUser);
			commonUtil.getPrintWriter().println("1");
		}else{
			commonUtil.getPrintWriter().println("0");
		}
	}
	/*
	 * 注册
	 */
	public void regist() {
		System.out.println(addUser);
		int status = userDAO.regist(addUser);
		Map<String, String> msgMap = new HashMap<String, String>();
		if (status == 1) {
			msgMap.put("msg", "注册成功");
			msgMap.put("code", "1");
		}else if (status == 0) {
			msgMap.put("msg", "用户名已存在");
			msgMap.put("code", "0");
		}else{
			msgMap.put("msg", "内部错误，请在尝试一次");
			msgMap.put("code", "-1");
		}
	}
	
	public void update() {
		user = (User) commonUtil.getSession("user");
		System.out.println(updateUser);
		Map<String, String> msgMap = new HashMap<String, String>();
		if (user.getPassword().equals(updateUser.getPassword())) {
			System.out.println(newPass);
			if (!updateUser.getPassword().equals(newPass)) {
				
				updateUser.setPassword(newPass);
			}
			updateUser.setUID(user.getUID());
			int status = userDAO.update(updateUser);
			if (status > 0) {
				msgMap.put("msg", "修改成功");
				msgMap.put("code", "1");
				commonUtil.setSession("user", userDAO.findUserById(user.getUID()));
			}else{
				msgMap.put("msg", "修改失败，请重试");
				msgMap.put("code", "0");
			}
			
		}else{
			msgMap.put("msg", "原密码错误，请输入正确密码");
			msgMap.put("code", "0");
		}
		JSONObject jsonObject = new JSONObject(msgMap);
		System.out.println(jsonObject.toString());
		commonUtil.getPrintWriter().println(jsonObject.toString());
		/*if (status == 1) {
			msgMap.put("msg", "注册成功");
			msgMap.put("code", "1");
		}else if (status == 0) {
			msgMap.put("msg", "用户名已存在");
			msgMap.put("code", "0");
		}else{
			msgMap.put("msg", "内部错误，请在尝试一次");
			msgMap.put("code", "-1");
		}*/
	}
	
	public void logout() {
		commonUtil.setSession("user", null);
		commonUtil.getPrintWriter().print("1");
	}
	
	public String execute() {
		user = (User) commonUtil.getSession("user");
		if (user == null) {
			return "login";
		}else{
			addresses = addressDAO.getAddressByUser(user);
			
		}
		return "ok";
	}
	
	public String getNewPass() {
		return newPass;
	}
	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}
	public List<Address> getAddresses() {
		return addresses;
	}
	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getAddUser() {
		return addUser;
	}
	public void setAddUser(User addUser) {
		this.addUser = addUser;
	}
	public User getDelUser() {
		return delUser;
	}
	public void setDelUser(User delUser) {
		this.delUser = delUser;
	}
	public User getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(User updateUser) {
		this.updateUser = updateUser;
	}
	
}
