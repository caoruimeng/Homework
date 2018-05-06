package com.homework.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.homework.entity.Homework;
public interface HomeworkDao {
	
	int addHomework(@Param("hw") Homework hw);
	
	List<Homework> getHomework(@Param("cId") Integer cId);
	
	// Homework getHomeworkById(@Param("id") Integer id);
}
