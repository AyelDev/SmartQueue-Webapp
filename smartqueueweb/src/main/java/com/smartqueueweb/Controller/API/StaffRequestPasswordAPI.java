package com.smartqueueweb.Controller.API;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Class.JwtValidator;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/StaffRequestPasswordAPI")
public class StaffRequestPasswordAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl service = new ServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			String username = JwtValidator.fixGarbledCharacters(request.getParameter("username"));	
			String email = JwtValidator.fixGarbledCharacters(request.getParameter("email"));	
			int isRequested = service.requestStaffPassword(username, email);
			if (isRequested >= 1) {
			  response.setContentType("text/plain");
			  response.setStatus(HttpServletResponse.SC_OK);
			  response.getWriter().write("Your password request has been successfully submitted. Please wait for admin approval.");
			} else {
			  throw new Exception();
			}
		  } catch (Exception e) {
			response.setContentType("text/plain");
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("Invalid Username or Email. Please contact the admin for further assistance.");
			
		  }
	}

}
