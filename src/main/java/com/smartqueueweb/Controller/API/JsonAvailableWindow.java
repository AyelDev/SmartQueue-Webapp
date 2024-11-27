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


@WebServlet("/JsonAvailableWindow")
public class JsonAvailableWindow extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ServiceImpl service = new ServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Gson gson = new Gson();
			//String servicetype = JwtValidator.fixGarbledCharacters(request.getParameter("servicetype"));
			List<ServicesBean> ss = service.windowList();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			if (ss.isEmpty()) {
				throw new Exception();
			}

			String userJson = gson.toJson(ss);
			PrintWriter out = response.getWriter();
			out.print(userJson);
			out.flush();

		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("{\"error\":\"Requested services failed.\"}");
		}
		
	}

}
