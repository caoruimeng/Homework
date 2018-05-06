package com.homework.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.homework.entity.Classes;
import com.homework.entity.Exercises;
import com.homework.entity.HWResult;
import com.homework.entity.Homework;
import com.homework.entity.Test;
import com.homework.entity.User;
import com.homework.service.ClassesService;
import com.homework.service.UserService;


@Controller
@RequestMapping("admin/classes")
public class ClassesController {

	@Autowired
	private ClassesService classesService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("my")
	@ResponseBody
	public List<Classes> getMyClasses(HttpServletRequest request){
		User user=(User)request.getSession().getAttribute("user");
		Integer teaId=user.getUserId();
		List<Classes> list = classesService.loadClassesByteaId(teaId);
		System.out.println(list);
		return list;
	}
	
	@RequestMapping("")
	public String getClassesPage() {
		return "admin/classes";
	}
	
	@RequestMapping("add")
	@ResponseBody
	public HWResult addClasses(Classes classes,HttpServletRequest request){
		User user=(User)request.getSession().getAttribute("user");
		Integer teaId=user.getUserId();
		return classesService.addClasses(classes, teaId);
	}
	
	@RequestMapping("getStudent/{classId}")
	public List<User> getStudent(@PathVariable("classId") Integer classId){
		return userService.getStudentByClassId(classId);
	}
	
	@RequestMapping("/{classId}")
	public ModelAndView getClassDetailPage(@PathVariable("classId") Integer classId) {
		ModelAndView mv=new ModelAndView("admin/classes_detail");
		mv.addObject("classId", classId);
		return mv;
	}
	
	/**
	 * 试卷
	 */
	
	@RequestMapping("/getTest/{classId}")
	@ResponseBody
	public List<Test> getTestByClassId(@PathVariable("classId") Integer classId){
		return classesService.getTestByClassId(classId);
	}
	
	@RequestMapping("/getTestExe/{testId}")
	@ResponseBody
	public List<Exercises> getTestExe(@PathVariable("testId") Integer testId){
		return classesService.getTestExe(testId);
	}
	
	@RequestMapping("/addTest")
	@ResponseBody
	public HWResult addTest(Test test) {
		return classesService.addTest(test);
	}
	
	@RequestMapping("/addTestExe")
	@ResponseBody
	public HWResult addTestExe(Integer testId,@RequestParam("idList[]") List<Integer> idList){
		System.out.println(testId+idList.toString());
		return classesService.addTestExe(testId, idList);
	}
	
	@RequestMapping("/addHW")
	@ResponseBody
	public HWResult addHw(Homework homework,String date) throws ParseException{
		System.out.println(homework.toString());
		 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 Date d=simpleDateFormat.parse(date);
		 homework.setEndDate(d);
		return classesService.addHW(homework);
	}
	
	@RequestMapping("/getHw/{classId}")
	@ResponseBody
	public List<Homework> getHomework(@PathVariable("classId") Integer classId){
		return classesService.getHomework(classId);
	}
	
	@RequestMapping("/test/{testId}")
	public String getTestListByTestId(@PathVariable("testId") Integer testId) {
		return "test_preview";
		
	}
	
	@RequestMapping("/test/{testId}/getExe")
	@ResponseBody
	public Map<String,Object> getExeByTestId(@PathVariable("testId") Integer testId){
		Map<String,Object> map=new HashMap<>();
		Test test=classesService.getTestById(testId);
		List<Exercises> list=classesService.getTestExe(testId);
		map.put("test", test);
		map.put("list", list);
		return map;
	}
}
