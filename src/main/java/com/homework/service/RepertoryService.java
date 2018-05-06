package com.homework.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homework.dao.RepertoryDao;
import com.homework.entity.Exercises;
import com.homework.entity.HWResult;

@Service
public class RepertoryService {

	@Autowired
	private RepertoryDao repertoryDao;
	
	public List<Exercises> getExercisesBySubId(Integer subId){
		return repertoryDao.getExercisesBySubId(subId);
	}
	
	public HWResult addExercises(Exercises exe) {
		int row=repertoryDao.addExercises(exe);
		if(row == 1)
			return HWResult.ok();
		return HWResult.build(500, "添加习题失败");
	}
	
	public List<Exercises> getExeByClassId(Integer classId){
		return repertoryDao.getExeByClassId(classId);
	}
	
	public List<Exercises> getExeByTestId(Integer testId){
		return repertoryDao.getExeByTestId(testId);
	}
}
