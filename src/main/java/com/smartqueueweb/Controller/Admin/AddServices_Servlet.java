package com.smartqueueweb.Controller.Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Class.ServiceType;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/AddServices_Servlet")
public class AddServices_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String program = request.getParameter("Program") != null ? request.getParameter("Program").toUpperCase() : null ;
		String amount = request.getParameter("Amount");
		String documentAndPurpose;
		String serviceType = request.getParameter("servicetype");
		int parseAmount = 0;

		var services = switch (serviceType) {
		case "general": {yield ServiceType.GENERAL;}
		case "records": {yield ServiceType.RECORDS;}
		case "archiving": {yield ServiceType.ARCHIVING;}
		default:
			throw new IllegalArgumentException("Unexpected value: " + serviceType);
		};
		
		if(request.getParameter("Document") != null)
			documentAndPurpose = request.getParameter("Document");
		else if(request.getParameter("Purpose") != null)
			documentAndPurpose = request.getParameter("Purpose");
		else
			documentAndPurpose = null;
		
		if (amount != null)
			parseAmount = Integer.parseInt(amount);

		try {
			int service = new ServiceImpl().addService(program, documentAndPurpose, parseAmount, services);
			
			if (service != 1) {
				throw new Exception();
			}
			
			response.setContentType("text/plain");
			response.setStatus(HttpServletResponse.SC_ACCEPTED);
			response.getWriter().write("Added Successfully");
			
		} catch (Exception e) {
			response.setContentType("text/plain");
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("Something wrong with the server try again");
		}
	}

}
