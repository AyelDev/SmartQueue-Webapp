package com.smartqueueweb.Controller.API;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smartqueueweb.Service.ServiceImpl;

/**
 * Servlet implementation class GetAllEntries
 */
@WebServlet("/getallentries")
public class GetAllEntries extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			response.setContentType("application/json");
			ServiceImpl service = new ServiceImpl();
			Gson gson = new Gson();
			
			String jsonToString = gson.toJson(service.listOfEnquiries());
			
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write(jsonToString);
			
			
		}catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("Requested services failed.");
		}
		
	}

}
