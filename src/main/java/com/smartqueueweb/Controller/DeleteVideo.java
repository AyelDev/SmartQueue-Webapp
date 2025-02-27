package com.smartqueueweb.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/deletevideo")
public class DeleteVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ServiceImpl service = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		service = new ServiceImpl();
		String idRaw = request.getParameter("id");
		int id;
	
		
		if(idRaw == null) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
		id = Integer.parseInt(idRaw);
		
		try {
			
			boolean isDeleted = service.deleteVideo(id);
			
			if(isDeleted) {
				response.setStatus(HttpServletResponse.SC_OK);
				return;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("there is problem with the server");
		}
		
		

	}

}
