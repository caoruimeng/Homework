package com.homework.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homework.dao.ClassesDao;
import com.homework.dao.HomeworkDao;
import com.homework.entity.Classes;
import com.homework.entity.Exercises;
import com.homework.entity.HWResult;
import com.homework.entity.Homework;
import com.homework.entity.Test;

@Service
public class ClassesService {

	@Autowired
	private ClassesDao classesDao;
	
	@Autowired
	private HomeworkDao homeworkDao;
	
	public List<Classes> loadClassesByteaId(Integer teaId) {
		return classesDao.loadClassesByteaId(teaId);
	}
	
	public HWResult addClasses(Classes classes,Integer teaId) {
		int row=classesDao.addClasses(classes, teaId);
		if(row==1)
			return HWResult.ok();
		return HWResult.build(500, "添加失败");
	}
	
	public List<Test> getTestByClassId(Integer classId){
		return classesDao.getTestByClassId(classId);
	}
	
	public List<Exercises> getTestExe(Integer testId){
		return classesDao.getTestExe(testId);
	}
	
	public HWResult addTest(Test test) {
		int row= classesDao.addTest(test);
		if(row==1)
			return HWResult.ok();
		return HWResult.build(500, "新增失败");
	}
	
	public HWResult addTestExe(Integer testId,List<Integer> idList) {
		int row=classesDao.addTestExe(testId,idList);
		if(row==0)
			return HWResult.build(500, "添加失败");
		return HWResult.ok();
	}
	
	public HWResult addHW(Homework homework) {
		int row= homeworkDao.addHomework(homework);
		if(row==1)
			return HWResult.ok();
		return HWResult.build(500, "添加失败");
	}
	
	public List<Homework> getHomework(Integer cId){
		return homeworkDao.getHomework(cId);
	}
	
	public Test getTestById(Integer testId) {
		return classesDao.getTestById(testId);
	}
}
