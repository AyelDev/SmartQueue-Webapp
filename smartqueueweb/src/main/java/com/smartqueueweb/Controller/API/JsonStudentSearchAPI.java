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
import com.smartqueueweb.Model.StudentBean;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/JsonStudentSearchAPI")
public class JsonStudentSearchAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ServiceImpl services = new ServiceImpl();
	RequestDispatcher rd = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		Gson gson = new Gson();
		String studentid  =  request.getParameter("studentid").trim();
		String studentfirstname  =  request.getParameter("firstname").trim();
		String studentmiddlename  =  request.getParameter("middlename").trim();
		String studentidstudentlastname  =  request.getParameter("lastname").trim();

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		if(studentid != "" && studentid.length() < 6) {
			 response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			    response.getWriter().write("{\"error\":\"Invalid student ID length.\"}");
		}else {
			StudentBean ss = services.searchStudentInquiry(Long.parseLong(studentid), studentfirstname, studentmiddlename, studentidstudentlastname);
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
