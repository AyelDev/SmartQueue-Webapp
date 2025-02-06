package com.smartqueueweb.Controller.Staff;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Service.ServiceImpl;

import net.bytebuddy.implementation.bytecode.Throw;


@WebServlet("/ResetPassStepOne")
public class ResetPassStepOne extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl service = null;
	
	public ResetPassStepOne() {
		super();
		service = new ServiceImpl();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
		try {
			
			if(email == null) {
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				response.getWriter().write("Input Error...");
				return;
			}
			
			boolean resetPass = service.resetPasswordStep1(email);
			
			if(!resetPass) {
				throw new Exception();
			}
			
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("Operation successful. Next, please enter your 4 digit PIN.");
			
		}catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("Invalid credencials please try again");
		}
		
		
	}

}
