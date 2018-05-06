package com.homework.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.homework.entity.User;

public interface UserDao {
	
	User checkUser(@Param("uno") String userNo,@Param("pw") String password);
	
	List<User> getAllUser();
	
	List<User> getStudentByClassId(@Param("classId") Integer classId);

}
