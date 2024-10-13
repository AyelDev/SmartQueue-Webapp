package com.smartqueueweb.Controller.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"/listofcounter","/AdminlistOfCounter_Servlet"})
public class AdminlistOfCounter_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	RequestDispatcher rd = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		boolean loginSessionsAdmin = session.getAttribute("sessionAdmin") != null ? true : false;
		boolean loginSessionsStaff = session.getAttribute("sessionStaff") != null ? true : false;

		if (loginSessionsAdmin) {
			rd = request.getRequestDispatcher("admin/list_of_counter.jsp");
			rd.forward(request, response);
		}

		request.setAttribute("errorLogin", "Access Denied");
		rd = request.getRequestDispatcher("login.jsp");
		rd.include(request, response);
	}

}
