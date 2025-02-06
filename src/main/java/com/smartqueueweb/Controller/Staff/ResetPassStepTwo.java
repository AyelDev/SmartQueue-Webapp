package com.smartqueueweb.Controller.Staff;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/ResetPassStepTwo")
public class ResetPassStepTwo extends HttpServlet {
	private static final long serialVersionUID = 1L;
			
	ServiceImpl service = null;
	
	public ResetPassStepTwo() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			service = new ServiceImpl();
			String pin = request.getParameter("pin");
			String email = request.getParameter("email");
		
			try {			

			if(pin == null || email == null) {
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				response.getWriter().write("Input Error...");
				return;
			}
			
			response.setContentType("application/json");
			StaffBean resetPass = service.resetPasswordStep2(pin, email);

			if(resetPass == null) {
				throw new Exception();
			}
			
			Gson gson = new Gson();
			String toJson = gson.toJson(resetPass);

			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write(toJson);
			
		}catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("Invalid credencials please try again");
		}

	}

}
