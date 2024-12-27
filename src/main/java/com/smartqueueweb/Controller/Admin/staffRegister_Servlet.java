package com.smartqueueweb.Controller.Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Class.JwtValidator;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/staffRegister_Servlet")
public class staffRegister_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl services = new ServiceImpl();
	RequestDispatcher rd = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		// Retrieve the parameters from the request
		String firstName = JwtValidator.fixGarbledCharacters(request.getParameter("txtFirstname"));
		String lastName = JwtValidator.fixGarbledCharacters(request.getParameter("txtLastname"));
		String userName = JwtValidator.fixGarbledCharacters(request.getParameter("txtUsername"));
		String contactNo = JwtValidator.fixGarbledCharacters(request.getParameter("txtContactno"));
		String email = JwtValidator.fixGarbledCharacters(request.getParameter("txtEmail"));
		
		// Call the service to register staff
		try {
			int isTrue = services.registerStaff(firstName, lastName, email, Double.parseDouble(contactNo), userName);
			// Set character encoding for response
			if(isTrue >= 1){
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.setStatus(HttpServletResponse.SC_OK);
				response.getWriter().write("Registration successful.");
			}else{
				throw new Exception();
			}
			
		} catch (Exception e) {
			response.setContentType("text/plain");
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("Registration failed.");
		}
	}

	
	
}

