package com.homework.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homework.dao.UserDao;
import com.homework.entity.User;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	public User checkUser(User user) {
		User checkUser=userDao.checkUser(user.getUserNo(), user.getPassword());
		if(checkUser!=null && checkUser.getRole()!=0)
			return checkUser;
		return null;
	}
	
	public List<User> getAllUser(){
		return userDao.getAllUser();
	}
	
	public List<User> getStudentByClassId(Integer classId){
		return userDao.getStudentByClassId(classId);
	}
	
}
