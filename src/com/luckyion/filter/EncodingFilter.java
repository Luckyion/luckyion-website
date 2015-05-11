package com.luckyion.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.luckyion.pojo.Users;

//过滤字符
public class EncodingFilter implements Filter {

	public void destroy() {

	}

	 
	public void doFilter(ServletRequest request, ServletResponse response, 
		FilterChain chain) throws IOException, ServletException { 
		HttpServletRequest req = (HttpServletRequest) request; 
		request.setCharacterEncoding("utf-8");
		/*
		if (req.getHeader("RequestType") != null && req.getHeader("RequestType").equalsIgnoreCase("ajax")) { 
			request.setCharacterEncoding("utf-8"); 
		} else { 
			request.setCharacterEncoding("gbk"); 
		} */
		chain.doFilter(request, response); 
	} 


	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
