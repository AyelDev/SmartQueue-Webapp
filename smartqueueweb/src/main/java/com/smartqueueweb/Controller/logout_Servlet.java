package com.smartqueueweb.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({ "/login", "/logout_Servlet" })
public class logout_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	RequestDispatcher rd = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		// session.removeAttribute("sessionName");
		if (session != null) {
			session.invalidate();
		}

		// response.sendRedirect("login.jsp");
		rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);

	}

}