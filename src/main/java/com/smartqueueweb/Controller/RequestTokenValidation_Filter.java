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
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Class.JwtValidator;
import com.smartqueueweb.Service.ServiceImpl;

@WebFilter({

		// api
		"/JsonStaffListAPI", "/JsonStudentListAPI",

		// admin
		"/RemoveStaff_Servlet",
		"/RemoveStudent_Servlet",
		"/stafflist",
		"/staffRegister_Servlet",
		"/studentlist", "/StudentList_Servlet",
		"/studentRegister_Servlet",
		"/UpdateStaff_Servlet",
		"/UpdateStudent_Servlet",

		// admin redirection
		"/listofcounter",
		"/CounterWindow_Servlet", "/counterwindow",
		"/videoads",
		"/admindashboard",
		"/counterlist",
		"/videoads",


		// staff
		"/addstudent", "/AddStudent_Servlet",
		"/entertainment", "/EntertainmentStaff_Servlet",

		// staff redirection
		"/counterwindow",
		"/staffdashboard",
		"/counterwindow",

		//ping
		"/ping",
})

public class RequestTokenValidation_Filter implements Filter {

	JwtValidator validator;
	RequestDispatcher rd;
	ServiceImpl services;

	public RequestTokenValidation_Filter() {
		// TODO Auto-generated constructor stub
		 validator = new JwtValidator();
		 rd = null;
		 services = new ServiceImpl();
	}

	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("destroy");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String path = httpRequest.getRequestURI();

		// if (path.contains("/login_Servlet") || path.contains("/dashboard")) {
		// chain.doFilter(request, response); // Skip filtering for this path
		// }
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
		
		if(services.clearAllQueueEntries())
		System.out.println("last queue entries deleted");
		else
		System.out.println("somethings wrong deleting queue entries in the past transactions...");
		// TODO Auto-generated method stub
		System.out.println("start app...");
	}

}
