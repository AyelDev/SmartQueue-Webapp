package com.smartqueueweb.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Service.ServiceImpl;


@WebServlet("/studentRegister_Servlet")
public class studentRegister_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl services = new ServiceImpl();
	RequestDispatcher rd = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   // Retrieve the parameters from the request
        String firstName = request.getParameter("txtFirstname");
        String middleName = request.getParameter("txtMiddlename");
        String lastName = request.getParameter("txtLastname");
        String course = request.getParameter("purpose");
        String idNumber = request.getParameter("txtIdnumber");

       
        
     // Call the service to register staff
        try {
        	 services.addStudent(Long.parseLong(idNumber), firstName, middleName, lastName, course);
        	 response.setContentType("text/plain");
             response.setStatus(HttpServletResponse.SC_OK);
             response.getWriter().write("Registration successful.");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Registration failed.");
        }
	}

}
