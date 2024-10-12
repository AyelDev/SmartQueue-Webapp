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

import com.smartqueueweb.Class.JwtValidator;
import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet({ "/login_Servlet", "/dashboard" })
public class login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl services = new ServiceImpl();
	RequestDispatcher rd = null;
	JwtValidator validator = new JwtValidator();
	Cookie cookie = null;

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
			cookie = new Cookie("_auth", validator.generatedAuthCode(services.adminDetails(userName).getAdminId(),
					services.adminDetails(userName).getUsername(), "admin"));
			cookie.setMaxAge(7200); // Set the expiry time to 2 hour
			cookie.setPath("/");
			response.addCookie(cookie);
			// services.GenerateStaffToken("admin", authcode);
			rd = request.getRequestDispatcher("admin/adminpage.jsp");
			rd.forward(request, response);
		}

		if (isStaffLogTrue && !isStaffLocked) {
			StaffBean staffDetails = services.loginStaffDetail(userName);
			session.setAttribute("sessionStaff", staffDetails);
			cookie = new Cookie("_auth",
					validator.generatedAuthCode(staffDetails.getStaffID(), staffDetails.getUsername(), "staff"));
			cookie.setMaxAge(7200); // Set the expiry time to 2 hour
			cookie.setPath("/");
			response.addCookie(cookie);
			rd = request.getRequestDispatcher("staff/staffpage.jsp");
			rd.forward(request, response);
		}

		if (!isStaffLogTrue && !isAdminLogTrue) {
			request.setAttribute("errorLogin", services.XMLERRORNAME("API.LOGINFAILED"));
			rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}

		if (isStaffLocked) {
			request.setAttribute("errorLogin", services.XMLERRORNAME("API.ACCOUNTLOCKED"));
			rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// HttpSession session = request.getSession();
		rd = request.getRequestDispatcher("admin/adminpage.jsp");
		rd.forward(request, response);
		try {
			validator.decode(validator.getCookieValue(request.getCookies(), "_auth"));
			rd = request.getRequestDispatcher("admin/adminpage.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// e.getMessage();
			request.setAttribute("errorLogin", services.XMLERRORNAME("API.TOKENAUTHTENTICATIONFAILED"));
			rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}

	}

}
