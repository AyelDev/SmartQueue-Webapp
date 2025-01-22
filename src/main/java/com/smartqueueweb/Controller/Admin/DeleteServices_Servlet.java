package com.smartqueueweb.Controller.Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/DeleteServices_Servlet")
public class DeleteServices_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int idNo = Integer.parseInt(request.getParameter("idNo"));
		
		try {
			boolean service = new ServiceImpl().deleteService(idNo);
			
			if (!service) {
				throw new Exception();
			}
			
			response.setContentType("text/plain");
			response.setStatus(HttpServletResponse.SC_ACCEPTED);
			response.getWriter().write("Deleted Successfully");
			
		} catch (Exception e) {
			response.setContentType("text/plain");
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("Something wrong with the server try again");
		}
	}

}
