package com.smartqueueweb.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/login_Servlet")
public class login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// smartqueue_DataAccessLayer database = new smartqueue_DataAccessLayer();
	ServiceImpl services = new ServiceImpl();
	RequestDispatcher rd = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("txtUsername");
		String passWord = request.getParameter("txtPassword");
		HttpSession session = request.getSession();
		// PrintWriter out = response.getWriter();
		
		boolean isAdminLogTrue = services.loginAdmin(userName, passWord);
		boolean isStaffLogTrue = services.loginStaff(userName, passWord);
		
		boolean isStaffLocked = services.isStaffLocked(userName);
		
		if (isAdminLogTrue) {
			session.setAttribute("sessionAdmin", services.adminDetails(userName));
			rd = request.getRequestDispatcher("admin/adminpage.jsp");
			rd.forward(request, response);
		}

		if (isStaffLogTrue && !isStaffLocked) {
			StaffBean staffDetails = services.loginStaffDetail(userName);
			session.setAttribute("sessionStaff", staffDetails);
			rd = request.getRequestDispatcher("staff/staffpage.jsp");
			rd.forward(request, response);
		}
		
		if (!isStaffLogTrue && !isAdminLogTrue) {
			request.setAttribute("errorLogin", "login failed");
			rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}
		
		if(isStaffLocked) {
			request.setAttribute("errorLogin", "Your Account is Locked Please Contact the Admin");
			rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}

	}

}
