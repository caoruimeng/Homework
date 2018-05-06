package com.homework.entity;

public class Subject {
	private Integer subId;
	private String subName;
	private String subNo;
	private String subImg;
	private String subInfo;
	
	public String getSubNo() {
		return subNo;
	}
	public void setSubNo(String subNo) {
		this.subNo = subNo;
	}
	
	public Integer getSubId() {
		return subId;
	}
	public void setSubId(Integer subId) {
		this.subId = subId;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getSubImg() {
		return subImg;
	}
	public void setSubImg(String subImg) {
		this.subImg = subImg;
	}
	public String getSubInfo() {
		return subInfo;
	}
	public void setSubInfo(String subInfo) {
		this.subInfo = subInfo;
	}
	@Override
	public String toString() {
		return "Subject [subId=" + subId + ", subName=" + subName + ", subNo=" + subNo + ", subImg=" + subImg
				+ ", subInfo=" + subInfo + "]";
	}
	

}
