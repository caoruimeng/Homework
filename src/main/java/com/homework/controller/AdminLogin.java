package com.homework.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.homework.entity.HWResult;
import com.homework.entity.User;
import com.homework.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminLogin {
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("")
	public String loginPage() {
		return "admin/login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST )
	@ResponseBody
	public HWResult login(User user,HttpServletRequest request) {
		
		User checkUser=userService.checkUser(user);
		if(checkUser!=null) {
			request.getSession().setAttribute("user", checkUser);
			return HWResult.ok();
		}
		else
			return HWResult.build(400, "教职工号或密码错误");
	}
	
	@RequestMapping("main")
	public String getAdminMainPage() {
		return "admin/main";
	}

}
