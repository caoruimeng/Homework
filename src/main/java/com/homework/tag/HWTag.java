package com.homework.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class HWTag <T> extends SimpleTagSupport{

	private long time;
	
	

	public long getTime() {
		return time;
	}



	public void setTime(long time) {
		this.time = time;
	}



	@Override
	public void doTag() throws JspException, IOException {
		// TODO Auto-generated method stub
		super.doTag();
		System.out.println(time);
	}

}
