package com.smartqueueweb.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Service.ServiceImpl;


@WebServlet({"/userwindow", "/Userwindow_Servlet"})
public class Userwindow_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl services = new ServiceImpl();
	RequestDispatcher rd = null;	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		rd = request.getRequestDispatcher("staff/user_window.jsp");
		rd.forward(request, response);
	}

}
