package com.smartqueueweb.Controller.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smartqueueweb.Service.ServiceImpl;


@WebServlet({"/stafflist"})
public class StaffList_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ServiceImpl services = new ServiceImpl();
	RequestDispatcher rd = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		Gson gson = new Gson();
		boolean loginSessionsAdmin = session.getAttribute("sessionAdmin") != null ? true : false;
		boolean loginSessionsStaff = session.getAttribute("sessionStaff") != null ? true : false;

		cookiess(request, response,"admin/list_of_staff.jsp");
			

		// if (loginSessionsAdmin) {
		// 	rd = request.getRequestDispatcher("admin/list_of_staff.jsp");
		// 	rd.forward(request, response);
		// }

		// request.setAttribute("errorLogin", "Access Denied");
		// rd = request.getRequestDispatcher("login.jsp");
		// rd.include(request, response);

		
//		response.getWriter().append("Served at:"
//				+ services.listsOfStaff()
//				+ " ").append(request.getContextPath());
		
//		List<StaffBean> ss = services.listsOfStaff();
//		
//		
//		String userJson = gson.toJson(ss);
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
//		
//		PrintWriter out = response.getWriter();
//		out.print(userJson);
//		out.close();
		
		
		
//		session.setAttribute("stafflists", ss);
//		rd = request.getRequestDispatcher("./admin/list_of_staff.jsp");
//		rd.forward(request, response);
	}

	public static void cookiess(HttpServletRequest request, HttpServletResponse response, String path)throws ServletException, IOException{
		RequestDispatcher rd = null;
		Cookie cookies[] = request.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("_auth")) {
				rd = request.getRequestDispatcher(path);
				rd.forward(request, response);
			
			}else {
				c.setMaxAge(0);
				request.setAttribute("errorLogin", "Access Denied");
				rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}
		}
	}
}
