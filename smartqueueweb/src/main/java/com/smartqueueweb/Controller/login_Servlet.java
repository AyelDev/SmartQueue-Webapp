package com.smartqueueweb.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smartqueueweb.DAO.smartqueue_DataAccessLayer;

@WebServlet("/login_Servlet")
public class login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	smartqueue_DataAccessLayer database = new smartqueue_DataAccessLayer();
	RequestDispatcher rd = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("txtUsername");
		String passWord = request.getParameter("txtPassword");
		HttpSession session = request.getSession();
		//PrintWriter out = response.getWriter();

		if (userName.equals("cecadmin") && passWord.equals("cecadminpass")) {
			session.setAttribute("sessionName", userName);
			rd = request.getRequestDispatcher("admin/adminpage.jsp");
			rd.forward(request, response);
		}

		database.Login(userName, passWord);
		if (!database.Login(userName, passWord)) {
			request.setAttribute("errorLogin", "login failed");
			rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		} else {
			session.setAttribute("sessionName", userName);
			rd = request.getRequestDispatcher("staff/staffpage.jsp");
			rd.forward(request, response);
		}

	}

}
