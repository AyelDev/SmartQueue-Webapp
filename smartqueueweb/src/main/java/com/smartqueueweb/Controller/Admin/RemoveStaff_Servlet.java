package com.smartqueueweb.Controller.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Service.ServiceImpl;


@WebServlet("/RemoveStaff_Servlet")
public class RemoveStaff_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl services = new ServiceImpl();
	RequestDispatcher rd = null;
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idNo = request.getParameter("idNo");
		
		
	    
	     // Call the service to register staff
	        try {
	        	 services.deleteStaff(Long.parseLong(idNo));
	        	 response.setContentType("text/plain");
	             response.setStatus(HttpServletResponse.SC_OK);
	             response.getWriter().write("Deletion success.");
	        } catch (Exception e) {
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Deletion failed.");
	        }
		
	}

}
