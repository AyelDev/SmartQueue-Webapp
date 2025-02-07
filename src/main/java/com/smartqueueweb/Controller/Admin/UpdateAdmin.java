package com.smartqueueweb.Controller.Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/UpdateAdmin")
public class UpdateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl service = null;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idRaw = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			
			if(idRaw == null || username == null || password == null) {
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				response.getWriter().write("payload is empty");
			}
			
			service = new ServiceImpl();
			
			service.updateAdmin(Integer.parseInt(idRaw), username, password);
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("Update Successful");
			
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("There is problem with the server please try again");
		}
		
		//service.updateAdmin(null, username, password)
		
	}

}
