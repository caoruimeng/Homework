package com.homework.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.homework.entity.Exercises;
import com.homework.entity.HWResult;
import com.homework.service.RepertoryService;

@Controller
@RequestMapping("admin/repertory")
public class RepertoryController {

	@Autowired
	private RepertoryService repertoryService;
	
	@RequestMapping("")
	public String repertoryPage() {
		return "admin/repertory";
	}
	
	@RequestMapping("/{subId}")
	@ResponseBody
	public List<Exercises> getExercises(@PathVariable("subId") Integer subId) {
		return repertoryService.getExercisesBySubId(subId);
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public HWResult addExercises(Exercises exe) {
		System.out.println(exe);
		return repertoryService.addExercises(exe);
	}
	
	@RequestMapping("/getExe/{classId}")
	@ResponseBody
	public List<Exercises> getExeByClassId(@PathVariable("classId") Integer classId){
		
		return repertoryService.getExeByClassId(classId);
	}
	
	@RequestMapping("/getExeByTest/{testId}")
	@ResponseBody
	public List<Exercises> getExeByTest(@PathVariable("testId") Integer testId){
		return repertoryService.getExeByTestId(testId);
	}
	
}
