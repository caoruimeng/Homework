package com.homework.entity;

import java.util.Date;

public class Classes {
	private int classId;
	private String  className;
	private String classImg;
	private Date beginDate;
	private Date endDate;
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getClassImg() {
		return classImg;
	}
	public void setClassImg(String classImg) {
		this.classImg = classImg;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	

}
