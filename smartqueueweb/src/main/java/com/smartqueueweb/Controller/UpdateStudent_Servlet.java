package com.smartqueueweb.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Class.JwtValidator;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/UpdateStudent_Servlet")
public class UpdateStudent_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	public static String error;
	ServiceImpl service = new ServiceImpl();
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		long idNumber = Long.parseLong(request.getParameter("idnum"));
		long inputIdNumber = Long.parseLong(request.getParameter("inputidnum"));
		String firstName = JwtValidator.fixGarbledCharacters(request.getParameter("firstname")); 
		String middleName = JwtValidator.fixGarbledCharacters(request.getParameter("middlename")); 
		String lastName = JwtValidator.fixGarbledCharacters(request.getParameter("lastname"));
		String course = JwtValidator.fixGarbledCharacters(request.getParameter("course"));
		
		 try {
			 service.updateStudent(idNumber, inputIdNumber, firstName, middleName, lastName, course);
        	 response.setContentType("text/plain");
             response.setStatus(HttpServletResponse.SC_OK);
             response.getWriter().write("Update success.");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Deletion failed.");
        }
		
		
	
	}
}
