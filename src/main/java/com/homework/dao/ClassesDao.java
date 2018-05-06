package com.homework.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.homework.entity.Classes;
import com.homework.entity.Exercises;
import com.homework.entity.Test;

public interface ClassesDao {

	
	int addClasses(@Param("classes") Classes classes,@Param("teaId") Integer teaId);
	
	int updateClasses(@Param("classes") Classes classes);
	
	List<Classes> loadClassesByteaId(@Param("teaId") Integer teaId);
	
	/**
	 * 获取试卷
	 * @param classId
	 * @return
	 */
	List<Test> getTestByClassId(@Param("classId") Integer classId);
	
	List<Exercises> getTestExe(@Param("testId") Integer testId);
	
	int addTest(@Param("test") Test test);
	
	Test getTestById(@Param("testId") Integer testId);
	
	int addTestExe(@Param("testId") Integer testId,@Param("idList") List<Integer> idList);
}
