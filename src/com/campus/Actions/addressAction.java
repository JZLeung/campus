package com.campus.Actions;

import com.campus.Class.Address;
import com.campus.DAO.addressDAO;
import com.campus.utils.commonUtil;

public class addressAction {
	private Address newAdd;
	private Address updateAdd;
	private Address delAdd;
	/**
	 * 更新地址信息
	 */
	public void updateAdd() {
		System.out.println(updateAdd);
		int st = addressDAO.updateAdd(updateAdd);
		if (st > 0) {
			commonUtil.getPrintWriter().print("1");
		}else {
			commonUtil.getPrintWriter().print("0");
		}
	}
	/**
	 * 添加新地址
	 */
	public void addAdd() {
		System.out.println(newAdd);
		int st = addressDAO.addAdd(newAdd);
		if (st > 0) {
			commonUtil.getPrintWriter().print("1");
		}else {
			commonUtil.getPrintWriter().print("0");
		}
	}
	/**
	 * 删除地址
	 */
	public void delAdd() {
		System.out.println(delAdd);
		int st = addressDAO.delAdd(delAdd);
		if (st > 0) {
			commonUtil.getPrintWriter().print("1");
		}else {
			commonUtil.getPrintWriter().print("0");
		}
	}
	
	public Address getNewAdd() {
		return newAdd;
	}
	public void setNewAdd(Address newAdd) {
		this.newAdd = newAdd;
	}
	public Address getUpdateAdd() {
		return updateAdd;
	}
	public void setUpdateAdd(Address updateAdd) {
		this.updateAdd = updateAdd;
	}
	public Address getDelAdd() {
		return delAdd;
	}
	public void setDelAdd(Address delAdd) {
		this.delAdd = delAdd;
	}
	
}
