package com.smartqueueweb.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Class.JwtValidator;
import com.smartqueueweb.Service.ServiceImpl;


@WebServlet("/UpdateStaff_Servlet")
public class UpdateStaff_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl services = new ServiceImpl();
	RequestDispatcher rd = null;

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idNo = JwtValidator.fixGarbledCharacters(request.getParameter("idNo"));
		String firstname = JwtValidator.fixGarbledCharacters(request.getParameter("firstname"));
		String lastname = JwtValidator.fixGarbledCharacters(request.getParameter("lastname"));
		String email = JwtValidator.fixGarbledCharacters(request.getParameter("email"));
		String contacno = JwtValidator.fixGarbledCharacters(request.getParameter("contactno"));
		String username = JwtValidator.fixGarbledCharacters(request.getParameter("username"));
		String password = JwtValidator.fixGarbledCharacters(request.getParameter("password"));
		String islocked = JwtValidator.fixGarbledCharacters(request.getParameter("islocked"));
		
		  // Call the service to register staff
        try {
        	 services.updateStaff(Long.parseLong(idNo), firstname, lastname, email, Double.parseDouble(contacno), username, password, Integer.parseInt(islocked));
        	 response.setContentType("text/plain");
             response.setStatus(HttpServletResponse.SC_OK);
             response.getWriter().write("Update success.");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Deletion failed.");
        }
		
	}

}
