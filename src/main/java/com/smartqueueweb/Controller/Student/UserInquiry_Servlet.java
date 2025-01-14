package com.smartqueueweb.Controller.Student;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Class.JwtValidator;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/inquiry")
public class UserInquiry_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	RequestDispatcher rd = null;
	ServiceImpl services = new ServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		// Call the service to register staff
		try {

			String queueNum = JwtValidator.fixGarbledCharacters(request.getParameter("queueNum"));
			String fullname = JwtValidator.fixGarbledCharacters(request.getParameter("fullname"));
			String studentid = JwtValidator.fixGarbledCharacters(request.getParameter("studentid"));
			String purpose = JwtValidator.fixGarbledCharacters(request.getParameter("purpose"));
			String servicetype = JwtValidator.fixGarbledCharacters(request.getParameter("servicetype"));

			if(purpose.isEmpty() || servicetype.isEmpty() || fullname.isEmpty() || studentid.isEmpty()){
				throw new Exception();
			}
			//long studentIdparsed = Long.parseLong(studentid);
			
			//String regexPattern = "^(000|[1-9][0-9]{4,})$";
			String regexPattern = "	^000$";
			boolean PatternMatches = Pattern.matches(studentid, regexPattern);
			
			if(!PatternMatches) {
				response.setContentType("text/plain");
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				response.getWriter().write("Student Id should be '000' for new student");
				return;
			}
			
			int ifTrue = services.addToQueue(queueNum, studentid, fullname, purpose, servicetype);
			
			if(ifTrue >= 1){
				response.setContentType("text/plain");
				response.setStatus(HttpServletResponse.SC_OK);
				response.getWriter().write("Inquiry success.");
			}else{
				throw new Exception(); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			response.setContentType("text/plain");
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().write("Enquiry Failed please fill up the necessary form.");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		rd = request.getRequestDispatcher("/user/userinquiry.jsp");
		rd.forward(request, response);
	}

}
