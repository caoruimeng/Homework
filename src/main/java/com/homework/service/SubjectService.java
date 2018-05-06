package com.homework.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homework.dao.SubjectDao;
import com.homework.entity.HWResult;
import com.homework.entity.Section;
import com.homework.entity.Subject;

@Service
public class SubjectService {
	
	@Autowired
	private SubjectDao subjectDao;
	
	public List<Subject> getAllSubject(){
		return subjectDao.getAllSubject();
	}
	
	public List<Section> getSectionBySubId(Integer subId){
		return subjectDao.getSectionBySubId(subId);
	}
	
	public HWResult addSubject(Subject subject) {	
		int row = subjectDao.addSubject(subject);
		if(row == 1) return HWResult.ok();
		else return HWResult.build(500, "新增科目失败");
	}
	
	public HWResult updateSubject(Subject subject) {
		int row = subjectDao.updateSubject(subject);
		if(row == 1) return HWResult.ok();
		else return HWResult.build(500, "修改科目失败");
	}
	
	public HWResult deleteSubject(Integer subId) {
		int row = subjectDao.deleteSubject(subId);
		if(row == 1) return HWResult.ok();
		else return HWResult.build(500, "删除科目失败");
	}
	
	
	/**
	 * =========章节=========
	 */
	public HWResult addSection(Integer subId,String secName) {
		int row = subjectDao.addSection(subId,secName);
		if(row == 1) return HWResult.ok();
		else return HWResult.build(500, "添加章节失败");
	}
	
	public List<Section> getSectionByClassId(Integer classId){
		return subjectDao.getSectionByClassId(classId);
	}

}
