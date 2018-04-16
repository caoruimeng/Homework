package com.homework.entity;

public class Qusetion {

	private int queId;
	private String queTile;
	private int queType;
	private String queDesc;
	private int grade;  // 难度
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getQueId() {
		return queId;
	}
	public void setQueId(int queId) {
		this.queId = queId;
	}
	public String getQueTile() {
		return queTile;
	}
	public void setQueTile(String queTile) {
		this.queTile = queTile;
	}
	public int getQueType() {
		return queType;
	}
	public void setQueType(int queType) {
		this.queType = queType;
	}
	public String getQueDesc() {
		return queDesc;
	}
	public void setQueDesc(String queDesc) {
		this.queDesc = queDesc;
	}
	
	
}
