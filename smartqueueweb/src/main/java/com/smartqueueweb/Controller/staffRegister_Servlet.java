package com.smartqueueweb.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Service.ServiceImpl;


@WebServlet("/staffRegister_Servlet")
public class staffRegister_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ServiceImpl services = new ServiceImpl();
	RequestDispatcher rd = null;

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
