package com.homework.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.homework.entity.Section;
import com.homework.entity.Subject;

public interface SubjectDao {

	List<Subject> getAllSubject();
	
	List<Section> getSectionBySubId(@Param("subId") Integer subId);
	
	int deleteSubject(@Param("subId") Integer subId);
	
	int addSubject(@Param("sub") Subject subject);
	
	int updateSubject(@Param("sub") Subject subject);
	
	int addSection(@Param("subId") Integer subId,@Param("secName") String secName);
	
	List<Section> getSectionByClassId(@Param("classId") Integer classId);
}
