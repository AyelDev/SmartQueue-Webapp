package com.smartqueueweb.Controller.Student;

import static org.mockito.ArgumentMatchers.contains;

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
			String program = JwtValidator.fixGarbledCharacters(request.getParameter("program"));

			if (purpose.isEmpty() || servicetype.isEmpty() || fullname.isEmpty() || studentid.isEmpty()) {
				throw new Exception();
			}
			// long studentIdparsed = Long.parseLong(studentid);

			// String regexPattern = "^(000|[1-9][0-9]{4,})$";
			String regexPattern = "^000$";
			boolean PatternMatches = Pattern.matches(regexPattern, studentid);

			if (!PatternMatches && servicetype.equals("General")) {
				response.setContentType("text/plain");
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				response.getWriter().write("Student Id should be '000' for new student");
				return;
			}

			/*
			 * Summary run these to service methods to ensure optimization
			 */
			Thread thread1 = new Thread(() -> services.addToQueue(queueNum, studentid, fullname, purpose, servicetype));
			//Thread thread2 = new Thread(() -> services.tempRegisterStudent(studentid, fullnameSplitter(0, fullname),
					//fullnameSplitter(1, fullname), fullnameSplitter(2, fullname), program));

			/*
			 * Summary making sure it thread2 runs only on servicetype general
			 */
			if (servicetype.equals("General")) {
				// Start the threads
				thread1.start();
				//thread2.start();
			} else {
				thread1.start();
			}

			// Wait for both threads to complete
			try {
				thread1.join();
				//thread2.join();

				response.setContentType("text/plain");
				response.setStatus(HttpServletResponse.SC_OK);
				response.getWriter().write("Inquiry success.");

			} catch (InterruptedException e) {
				e.printStackTrace();
			}

//			int ifTrue = services.addToQueue(queueNum, studentid, fullname, purpose, servicetype);
//			
//			if(ifTrue >= 1){
//				response.setContentType("text/plain");
//				response.setStatus(HttpServletResponse.SC_OK);
//				response.getWriter().write("Inquiry success.");
//			}else{
//				throw new Exception(); 
//			}

		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println(e.getMessage());
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

	public String fullnameSplitter(int stringindex, String inputs) {
		String[] word = inputs.split(" ");
		return word[stringindex];
	}

}
