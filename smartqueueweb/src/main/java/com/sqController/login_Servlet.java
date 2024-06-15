package com.sqController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login_Servlet")
public class login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("txtUsername");
		String passWord = request.getParameter("txtPassword");
		PrintWriter out = response.getWriter();
		if(userName.equals("user") & passWord.equals("pass")) {
			out.print("login success");
		}else {
			out.print("login failed");
		}
	}

}
