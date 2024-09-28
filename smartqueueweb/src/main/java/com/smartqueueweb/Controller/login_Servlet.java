package com.smartqueueweb.Controller;

import java.io.IOException;
import java.net.HttpCookie;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;

import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet({ "/login_Servlet", "/dashboard" })
public class login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// smartqueue_DataAccessLayer database = new smartqueue_DataAccessLayer();
	ServiceImpl services = new ServiceImpl();
	RequestDispatcher rd = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cookie cookie = null;
		String userName = request.getParameter("txtUsername");
		String passWord = request.getParameter("txtPassword");
		HttpSession session = request.getSession();

		// PrintWriter out = response.getWriter();

		boolean isAdminLogTrue = services.loginAdmin(userName, passWord);
		boolean isStaffLogTrue = services.loginStaff(userName, passWord);

		boolean isStaffLocked = services.isStaffLocked(userName);

		if (isAdminLogTrue) {
			String authcode = generatedAuthCode();
			session.setAttribute("sessionAdmin", services.adminDetails(userName));
			cookie = new Cookie("_auth", authcode);
			cookie.setMaxAge(7200); // Set the expiry time to 2 hour
			cookie.setPath("/");
			response.addCookie(cookie);
			services.GenerateStaffToken("admin", authcode);
			rd = request.getRequestDispatcher("admin/adminpage.jsp");
			rd.forward(request, response);
		}

		if (isStaffLogTrue && !isStaffLocked) {
			StaffBean staffDetails = services.loginStaffDetail(userName);
			session.setAttribute("sessionStaff", staffDetails);
			cookie = new Cookie("_auth", generatedAuthCode());
			cookie.setMaxAge(7200); // Set the expiry time to 2 hour
			cookie.setPath("/");
			response.addCookie(cookie);
			rd = request.getRequestDispatcher("staff/staffpage.jsp");
			rd.forward(request, response);
		}

		if (!isStaffLogTrue && !isAdminLogTrue) {
			request.setAttribute("errorLogin", "login failed");
			rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}

		if (isStaffLocked) {
			request.setAttribute("errorLogin", "Your Account is Locked Please Contact the Admin");
			rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		boolean loginSessionsAdmin = session.getAttribute("sessionAdmin") != null ? true : false;
		boolean loginSessionsStaff = session.getAttribute("sessionStaff") != null ? true : false;

		if (loginSessionsAdmin) {
			rd = request.getRequestDispatcher("admin/adminpage.jsp");
			rd.forward(request, response);
		}

		request.setAttribute("errorLogin", "Access Denied");
		rd = request.getRequestDispatcher("login.jsp");
		rd.include(request, response);

	}

	protected String generatedAuthCode() {
		int length = 35;
		boolean useLetters = true;
		boolean useNumbers = true;
		String GeneratedPassword = RandomStringUtils.random(length, useLetters, useNumbers);
		String specialChars = "!@#$&()[]<>";
		GeneratedPassword += RandomStringUtils.random(10, specialChars);
		return GeneratedPassword;
	}
}
