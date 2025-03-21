package com.smartqueueweb.Controller.Staff;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/updateQueueStatus")
public class updateQueueStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl service = new ServiceImpl();

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String queueStatus = request.getParameter("queueStatus");
		String queueNumber = request.getParameter("queueNumber");
		try {
			
			// IF STAFF SET SERVING TO DONE IT WILL COUNT TO MONTHLY QUEUE ENTRIES
			Thread thread1 = new Thread(() -> service.updateQueueStatus(queueNumber, queueStatus));
			Thread thread2 = new Thread(() -> service.addMonthlyEnquiry());

	

				if(queueStatus.equals("DONE")){
					thread2.start();
				}

				thread1.start();
			
			try {

				thread1.join();
				thread2.join();
		

				response.setContentType("text/plain");
				response.setStatus(HttpServletResponse.SC_OK);
				response.getWriter().write("Inquiry success.");

			} catch (InterruptedException e) {
				throw new Exception();
			}
			
			
		// 	int isProcessed = service.updateQueueStatus(queueNumber, queueStatus);
			
		// 	if(isProcessed < 1) 
		// 		throw new Exception();
			
		// 		response.setContentType("text/plain");
		// 		response.setStatus(HttpServletResponse.SC_OK);
		// 		response.getWriter().write("Operation success.");
		
		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("Operation failed.");
		}
	}

}
