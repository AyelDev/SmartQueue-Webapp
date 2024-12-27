package com.smartqueueweb.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.auth0.jwt.interfaces.DecodedJWT;
import com.mysql.cj.Session;
import com.smartqueueweb.Class.JwtValidator;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/login")
public class LoginPage_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	RequestDispatcher rd = null;
	JwtValidator validator = new JwtValidator();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		ServiceImpl services = new ServiceImpl();

		String scheme = request.getScheme(); // http or https
		String serverName = request.getServerName(); // localhost or domain
		int serverPort = request.getServerPort(); // port number

		// URL
		// String redirectUrl = String.format("%s://%s:%d/smartqueueweb/logout", scheme,
		// serverName, serverPort);

		try {
			String cookieauth = validator.getCookieValue(request.getCookies(), "_auth");
			DecodedJWT decoded = validator.decode(cookieauth);
			String userRole = decoded.getClaim("userRole").toString().replace("\"", "");

			boolean adminLogged = userRole.equals("admin");
			boolean staffLogged = userRole.equals("staff");
			
			if (adminLogged) {
				response.sendRedirect("admindashboard");
			}

			if (staffLogged) {
				response.sendRedirect("staffdashboard");
			}

		} catch (Exception e) {
			//request.setAttribute("errorLogin", services.XMLERRORNAME("API.TOKENAUTHTENTICATIONFAILED"));
			rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}

	}

}
