package com.smartqueueweb.Controller.API;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smartqueueweb.Class.JwtValidator;
import com.smartqueueweb.Model.StudentBean;
import com.smartqueueweb.Service.ServiceImpl;


@WebServlet("/JsonFullnameSearchAPI")
public class JsonFullnameSearchAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl services = new ServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Gson gson = new Gson();
			String studentFirstname = request.getParameter("firstname").trim();
			String studentMiddlename  =  request.getParameter("middlename").trim();
			String studentLastname  =  request.getParameter("lastname").trim();
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			if(studentFirstname.isBlank() || studentLastname.isBlank() ) {
				 response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				    response.getWriter().write("{\"error\":\"Enter valid Name.\"}");
			}else {
				StudentBean ss = services.searchStudentFullnameInquiry(studentFirstname, studentMiddlename, studentLastname);
				String userJson = gson.toJson(ss);
				PrintWriter out = response.getWriter();
				out.print(userJson);
				out.flush();
			}
			
			} catch (NullPointerException e) {
			    // Handle possible null references
			    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			    response.getWriter().write("{\"error\":\"Required data is missing.\"}");
			} catch (Exception e) {
			    // Handle any other generic errors
			    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			    response.getWriter().write("{\"error\":\"An unexpected error occurred: " + e.getMessage() + "\"}");
			} finally {
			    if (response.getWriter() != null) {
			        response.getWriter().close();  // Ensure the PrintWriter is closed even in case of an error
			    }
			}
	}

}
