package com.smartqueueweb.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Service.ServiceImpl;


@WebServlet("/StaffList_Servlet")
public class StaffList_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ServiceImpl services = new ServiceImpl();
	RequestDispatcher rd = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
//		response.getWriter().append("Served at:"
//				+ services.listsOfStaff()
//				+ " ").append(request.getContextPath());
		
		List<StaffBean> ss = services.listsOfStaff();
		session.setAttribute("stafflists", ss);
		rd = request.getRequestDispatcher("./admin/list_of_staff.jsp");
		rd.forward(request, response);
	}

}
