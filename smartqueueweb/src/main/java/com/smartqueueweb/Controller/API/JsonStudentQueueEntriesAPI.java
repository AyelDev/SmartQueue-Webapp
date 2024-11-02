package com.smartqueueweb.Controller.API;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smartqueueweb.Model.ServicesBean;
import com.smartqueueweb.Service.ServiceImpl;

/**
 * Servlet implementation class JsonStudentQueueEntriesAPI
 */
@WebServlet("/JsonStudentQueueEntriesAPI")
public class JsonStudentQueueEntriesAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl service = new ServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		try {
			int window_number = Integer.parseInt(request.getParameter("window_number"));
			String queue_status = request.getParameter("queue_status");
			Gson gson = new Gson();

			List<ServicesBean> ss = service.studentQueueEntries(window_number, queue_status);

			String userJson = gson.toJson(ss);
		

			PrintWriter out = response.getWriter();
			out.print(userJson);
			out.flush();

		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//			response.getWriter().write("[{\"error\":\"An unexpected error occurred: " + e.getMessage() + "\"}]");
			response.getWriter().write("[{\"error\":\"An unexpected error occurred\"}]");
		}
	}

}
