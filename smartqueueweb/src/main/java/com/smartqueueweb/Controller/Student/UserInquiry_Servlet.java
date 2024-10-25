package com.smartqueueweb.Controller.Student;

import java.io.IOException;

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

		String queueNum = JwtValidator.fixGarbledCharacters(request.getParameter("queueNum"));
		String fullname = JwtValidator.fixGarbledCharacters(request.getParameter("fullname"));
		String studentid = JwtValidator.fixGarbledCharacters(request.getParameter("studentid"));
		String purpose = JwtValidator.fixGarbledCharacters(request.getParameter("purpose"));
		String servicetype = JwtValidator.fixGarbledCharacters(request.getParameter("servicetype"));

		// Call the service to register staff
		try {
			
			if(purpose.isEmpty() || servicetype.isEmpty() || fullname.isEmpty() || studentid.isEmpty()){
				throw new Exception();
			}

			int ifTrue = services.addToQueue(queueNum, Integer.parseInt(studentid), fullname, purpose, servicetype);
			
			if(ifTrue >= 1){
				response.setContentType("text/plain");
				response.setStatus(HttpServletResponse.SC_OK);
				response.getWriter().write("Inquiry success.");
			}else{
				throw new Exception(); 
			}
			
		} catch (Exception e) {
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
