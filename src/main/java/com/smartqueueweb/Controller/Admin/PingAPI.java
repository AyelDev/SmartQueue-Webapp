package com.smartqueueweb.Controller.Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.sasl.SaslClient;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ping")
public class PingAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
    		response.setCharacterEncoding("UTF-8");
    		
    		response.getWriter().write("{\r\n"
    				+ "  \"response\": true,\r\n"
    				+ "  \"quote\": \"You don't learn to walk by following rules. You learn by doing, and by falling over.\",\r\n"
    				+ "  \"authors\": \"Ariel P. Abelgas, Cindy Mae Labra, Irish Cabañero\",\r\n"
    				+ "\"School Year\": \"2024-2025\",\r\n"
    				+ "\"projectname\": \"smartqueueweb\"\r\n"
    				+ "\r\n"
    				+ "}"
    				);
          
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("null");
        }
	}	

//    out.println("\\" - Richard Branson");
//    out.println("SmartQueueWeb S.Y 2024-2025 :)");
//    out.println("Authors:");
//    out.println("Ariel P. Abelgas");
//    out.println("Cindy Mae Labra");
//    out.println("Irish Cabañero");

}
