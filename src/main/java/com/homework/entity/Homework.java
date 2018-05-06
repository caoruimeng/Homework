package com.homework.entity;

import java.util.Date;

public class Homework {
	private int hwId;
	private String hwTitle;
	private Date beginDate;
	private Date endDate;
	private Integer testId;
	private Integer secId;
	private Integer classId;
	
	private String testName;
	
	
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	public Integer getSecId() {
		return secId;
	}
	public void setSecId(Integer secId) {
		this.secId = secId;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public Integer getTestId() {
		return testId;
	}
	public void setTestId(Integer testId) {
		this.testId = testId;
	}
	private String sectionName;
	
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public int getHwId() {
		return hwId;
	}
	public void setHwId(int hwId) {
		this.hwId = hwId;
	}
	public String getHwTitle() {
		return hwTitle;
	}
	public void setHwTitle(String hwTitle) {
		this.hwTitle = hwTitle;
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
	@Override
	public String toString() {
		return "Homework [hwId=" + hwId + ", hwTitle=" + hwTitle + ", beginDate=" + beginDate + ", endDate=" + endDate
				+ ", testId=" + testId + ", sectId=" + secId + ", classId=" + classId + ", sectionName=" + sectionName
				+ "]";
	}
	

	
	
}
