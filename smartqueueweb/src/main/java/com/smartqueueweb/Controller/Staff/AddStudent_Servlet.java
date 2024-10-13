package com.smartqueueweb.Controller.Staff;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet({"/staff/addstudent", "/AddStudent_Servlet"})
public class AddStudent_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	RequestDispatcher rd = null;	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		rd = request.getRequestDispatcher("../staff/add_student.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
