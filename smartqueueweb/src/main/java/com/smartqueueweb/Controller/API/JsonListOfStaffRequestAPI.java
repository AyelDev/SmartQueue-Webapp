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
import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/JsonListOfStaffRequestAPI")
public class JsonListOfStaffRequestAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl service = new ServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		// TODO Auto-generated method stub
		// HttpSession session = request.getSession();
		try {
			int is_completed = Integer.parseInt(request.getParameter("is_completed"));
			Gson gson = new Gson();

			List<StaffBean> ss = service.listOfStaffRequests(is_completed);

			String userJson = gson.toJson(ss);
		

			PrintWriter out = response.getWriter();
			out.print(userJson);
			out.flush();

			if (is_completed > 1) {
				throw new Exception();
			}

		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//			response.getWriter().write("[{\"error\":\"An unexpected error occurred: " + e.getMessage() + "\"}]");
			response.getWriter().write("[{\"error\":\"An unexpected error occurred\"}]");
		}
	}

}
