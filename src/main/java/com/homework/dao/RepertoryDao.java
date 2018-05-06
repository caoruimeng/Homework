package com.homework.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.homework.entity.Exercises;
import com.homework.entity.Repertory;

public interface RepertoryDao {

	int addRepertory(@Param("rep") Repertory rep);
	
	List<Exercises> getExercisesBySubId(@Param("subId") Integer subId);
	
	int addExercises(@Param("exe") Exercises exercises);
	
	List<Exercises> getExeByClassId(@Param("classId") Integer classId);
	
	List<Exercises> getExeByTestId(@Param("testId") Integer testId);
}
