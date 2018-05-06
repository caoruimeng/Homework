package com.homework.entity;

public class Exercises {

	private Integer id;
	private String title;
	private Integer type; // 0:选择；1:判断；2:简答
	
	private String option;
	private Integer answer; //[0,1,2,3] 代表A(或者true)B(或者false)C、D
	private Integer grade;
	private Integer subId;
	
	public Integer getSubId() {
		return subId;
	}
	public void setSubId(Integer subId) {
		this.subId = subId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public Integer getAnswer() {
		return answer;
	}
	public void setAnswer(Integer answer) {
		this.answer = answer;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "Exercises [id=" + id + ", title=" + title + ", type=" + type + ", option=" + option + ", answer="
				+ answer + ", grade=" + grade + ", subId=" + subId + "]";
	} 
	
}
