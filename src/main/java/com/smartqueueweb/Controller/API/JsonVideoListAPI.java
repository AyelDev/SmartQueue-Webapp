package com.smartqueueweb.Controller.API;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smartqueueweb.Model.MediaBean;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/JsonVideoListAPI")
public class JsonVideoListAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl service = null;

	public JsonVideoListAPI() {
		super();
		service = new ServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setContentType("application/json");
			Gson gson = new Gson();

			List<MediaBean> videoLists = service.videoList();

			String jsonList = gson.toJson(videoLists);

			response.getWriter().write(jsonList);

		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("Requested services failed.");
		}
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
