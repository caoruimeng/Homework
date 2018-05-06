package com.homework.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.homework.entity.HWResult;
import com.homework.entity.Section;
import com.homework.entity.Subject;
import com.homework.service.SubjectService;
import com.homework.utils.CommonUtils;

@Controller
@RequestMapping("/admin/subject")
public class SubjectController {

	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping("")
	public String subjectPage() {
		
		return "admin/subject";
	}
	
	@RequestMapping("all")
	@ResponseBody
	public HWResult getAllSubject(){
		return HWResult.ok(subjectService.getAllSubject());
	}
	
	@RequestMapping("/{subId}")
	@ResponseBody
	public HWResult getSectionBySub(@PathVariable("subId") Integer subId) {
	
		return HWResult.ok(subjectService.getSectionBySubId(subId));
	}
	
	@RequestMapping("/addSection")
	@ResponseBody
	public HWResult addSection(@RequestParam("subId") Integer subId,@RequestParam("secName") String secName) {
		System.out.println(subId+" "+secName);
		return subjectService.addSection(subId, secName);
	}
	
	@RequestMapping("/addSubject")
	@ResponseBody
	public HWResult addSubject(HttpServletRequest request,Subject subject,
			@RequestParam("file") MultipartFile file) {
		 //如果文件不为空，写入上传路径
        if(!file.isEmpty()) {
            //上传文件路径
            String path = request.getServletContext().getRealPath("/images/");
            System.out.println(path);
            //上传文件名
            String filename = file.getOriginalFilename();
            String finalName=CommonUtils.getUUID()+CommonUtils.getResourceType(filename);
            subject.setSubImg("/homework/images/"+finalName);
            try {
				file.transferTo(new File(path+finalName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				return HWResult.build(500, "文件上传出错");
			}
          
        }
		System.out.println(subject);
		return subjectService.addSubject(subject);
	}
	
	@RequestMapping("getSectionByClassId/{classId}")
	@ResponseBody
	public List<Section> getSectionByClassId(@PathVariable("classId") Integer classId){
		return subjectService.getSectionByClassId(classId);
	}
}
