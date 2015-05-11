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

//过滤�?
public class LoginFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest reg, ServletResponse res,
			FilterChain filter) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) reg;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		if (user != null) {
			filter.doFilter(request, response);
		} else {
			request.getRequestDispatcher("window.top.location.href=login.jsp").forward(request,
					response);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
