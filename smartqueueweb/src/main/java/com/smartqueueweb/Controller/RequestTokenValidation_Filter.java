package com.smartqueueweb.Controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.smartqueueweb.Class.JwtValidator;
import com.smartqueueweb.Service.ServiceImpl;

@WebFilter({ "/listofcounter",
	"/CounterWindow_Servlet","/counterwindow",
	"/JsonStaffListAPI","/JsonStudentListAPI",
	"/RemoveStaff_Servlet","/RemoveStudent_Servlet",
	"/stafflist","/staffRegister_Servlet",
	"/studentlist", "/StudentList_Servlet", 
	"/studentRegister_Servlet",
	"/listofcounter","/UpdateStaff_Servlet",
	"/UpdateStaff_Servlet",
	"/UpdateStudent_Servlet",
	"/userwindow", "/Userwindow_Servlet",
	"/addstudent", "/AddStudent_Servlet",
	"/counterwindow",
	"/entertainment", "/EntertainmentStaff_Servlet",
	"/videoads"})
public class RequestTokenValidation_Filter implements Filter {

	public RequestTokenValidation_Filter() {
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String path = httpRequest.getRequestURI();
		JwtValidator validator = new JwtValidator();
		RequestDispatcher rd = null;
		ServiceImpl services = new ServiceImpl();

//		if (path.contains("/login_Servlet") || path.contains("/dashboard")) {
//			chain.doFilter(request, response); // Skip filtering for this path
//		}

		try {
			validator.decode(validator.getCookieValue(httpRequest.getCookies(), "_auth"));
			chain.doFilter(request, response);
		} catch (Exception e) {
			// e.getMessage();
			// 
			request.setAttribute("errorLogin", services.XMLERRORNAME("API.TOKENAUTHTENTICATIONFAILED"));
			rd = request.getRequestDispatcher("/logout");
			rd.forward(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
