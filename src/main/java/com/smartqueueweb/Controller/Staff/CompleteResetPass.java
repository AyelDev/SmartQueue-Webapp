package com.smartqueueweb.Controller.Staff;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Model.ServicesBean;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/CompleteResetPass")
public class CompleteResetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl service = null;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idRaw = request.getParameter("id");
		String password = request.getParameter("password");
		int id;
		try {
			
			if(idRaw == null || password == null) {
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				response.getWriter().write("Payload not sent please try again");
				return;
			}
			
			//CHECK PASSWORD STRENGTH
			if(password.length() < 4) {
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				response.getWriter().write("Please enter at least 5 characters.");
				return;
			}
			
			id = Integer.parseInt(idRaw);
			
			service = new ServiceImpl();
			service.completePasswordReset(password, id);
			
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("Password Reset Successful");
			
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("here’s an issue with the server. Please try again.");
		}
		
	}

}
