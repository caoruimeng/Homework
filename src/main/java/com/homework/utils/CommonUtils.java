package com.homework.utils;

import java.util.UUID;

public class CommonUtils {

	public static String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	
	public  static boolean isNullOrEmpty(String str){
		
		if(str==null)
			return true;
		if("".equals(str))
			return true;
		
		return false;
	}
	
	public static String getType(String str){
		
		int index=str.lastIndexOf("/");
		String ss="."+str.substring(index+1);
		return ss;
	}
	public static String getResourceType(String str){
		int index=str.lastIndexOf(".");
		return str.substring(index);
	}
	
}
