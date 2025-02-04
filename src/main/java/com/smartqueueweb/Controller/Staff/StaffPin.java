package com.smartqueueweb.Controller.Staff;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Service.ServiceImpl;


@WebServlet("/StaffPin")
public class StaffPin extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/plain");
		String pin = request.getParameter("pin");
		String rawStaffId = request.getParameter("staffId");
		ServiceImpl service = new ServiceImpl();
	 	String regex = "\\d+";
		RequestDispatcher rd = null;

		try {
			
			if(pin == null || rawStaffId == null) {
				throw new Exception();
			}

			if(!pin.matches(regex)){
				throw new Exception();
			}

			service.setStaffPin(pin, Integer.parseInt(rawStaffId));
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("Your PIN has been successfully set! You will be redirected to the login page shortly.");
		
		} catch (Exception e) {
			// TODO: handle exception
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("An unexpected error occurred please try again");
		}
		
		
		
	}

}
