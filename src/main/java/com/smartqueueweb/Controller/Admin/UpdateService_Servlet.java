package com.smartqueueweb.Controller.Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.KeySelector.Purpose;

import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/UpdateService_Servlet")
public class UpdateService_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idNo = Integer.parseInt(request.getParameter("idNo"));
		String program = request.getParameter("Program") != null ? request.getParameter("Program").toUpperCase() : null ;
		String amount = request.getParameter("Amount");
		String documentAndPurpose;
		String serviceType = request.getParameter("servicetype");
		int parseAmount = 0;
		
		
		if(request.getParameter("Document") != null)
			documentAndPurpose = request.getParameter("Document");
		else if(request.getParameter("Purpose") != null)
			documentAndPurpose = request.getParameter("Purpose");
		else
			documentAndPurpose = null;
		
		if (amount != null)
			parseAmount = Integer.parseInt(amount);

		try {
			boolean service = new ServiceImpl().updateService(idNo, program, documentAndPurpose, parseAmount);
			
			if (!service) {
				throw new Exception();
			}
			
			response.setContentType("text/plain");
			response.setStatus(HttpServletResponse.SC_ACCEPTED);
			response.getWriter().write("Updated Successfully");
			
		} catch (Exception e) {
			response.setContentType("text/plain");
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("Something wrong with the server try again");
		}
	}

}
