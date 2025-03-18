package com.product.config;

import org.springframework.web.servlet.HandlerInterceptor;

import com.product.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AuthHandler implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		User user = (User)request.getSession().getAttribute("userObj");
		if(user!=null) {
			return true;
		}
		else {
			response.sendRedirect("login");
//			response.getWriter().print("<h1>please Login</h1>");
			return false;
		}
		
	}
}
