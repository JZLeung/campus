package com.campus.Admin;

import java.util.List;

import com.campus.Class.Hotsell;
import com.campus.DAO.hotsellDAO;
import com.campus.utils.commonUtil;

public class hotsells {
	private Hotsell hotsell;
	private List<Hotsell> hotsells;
	
	public String execute() {
		hotsells = hotsellDAO.getAllHotsells();
		return "ok";
	}
	
	public void del() {
		System.out.println(hotsell);
		commonUtil.print(hotsellDAO.del(hotsell));
	}
	
	public void add() {
		System.out.println(hotsell);
		commonUtil.print(hotsellDAO.add(hotsell));
	}
	
	public void update() {
		System.out.println(hotsell);
		commonUtil.print(hotsellDAO.update(hotsell));
	}

	public Hotsell getHotsell() {
		return hotsell;
	}

	public void setHotsell(Hotsell hotsell) {
		this.hotsell = hotsell;
	}

	public List<Hotsell> getHotsells() {
		return hotsells;
	}

	public void setHotsells(List<Hotsell> hotsells) {
		this.hotsells = hotsells;
	}
	
}
