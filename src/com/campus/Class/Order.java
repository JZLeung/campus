package com.campus.Class;

import java.sql.Timestamp;

public class Order {
	private int OID;
	private int UID1;//买家UID
	private int UID2;//卖家UID
	private int BID;
	private Timestamp starttime;
	private Timestamp endtime;
	private float amount;
	private int statue;
	private int AID;
	private String senderadd;
	private String expressnum;
	private String express;
	public int getOID() {
		return OID;
	}
	public void setOID(int oID) {
		OID = oID;
	}
	public int getUID1() {
		return UID1;
	}
	public void setUID1(int uID1) {
		UID1 = uID1;
	}
	public int getUID2() {
		return UID2;
	}
	public void setUID2(int uID2) {
		UID2 = uID2;
	}
	public int getBID() {
		return BID;
	}
	public void setBID(int bID) {
		BID = bID;
	}
	public Timestamp getStarttime() {
		return starttime;
	}
	public void setStarttime(Timestamp starttime) {
		this.starttime = starttime;
	}
	public Timestamp getEndtime() {
		return endtime;
	}
	public void setEndtime(Timestamp endtime) {
		this.endtime = endtime;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public int getStatue() {
		return statue;
	}
	public void setStatue(int statue) {
		this.statue = statue;
	}
	public int getAID() {
		return AID;
	}
	public void setAID(int aID) {
		AID = aID;
	}
	public String getSenderadd() {
		return senderadd;
	}
	public void setSenderadd(String senderadd) {
		this.senderadd = senderadd;
	}
	public String getExpressnum() {
		return expressnum;
	}
	public void setExpressnum(String expressnum) {
		this.expressnum = expressnum;
	}
	public String getExpress() {
		return express;
	}
	public void setExpress(String express) {
		this.express = express;
	}
	public String toString() {
		return this.OID+"  买家："+this.UID1+"=>卖家："+this.UID2+",总价："+this.amount+",收货地址："+this.AID+",快递："+this.express+",开始时间："+this.starttime;
	}
}
