package com.smartqueueweb.Controller.API;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Model.StudentBean;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/JsonStudentListAPI")
public class JsonStudentListAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ServiceImpl services = new ServiceImpl();
	RequestDispatcher rd = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Gson gson = new Gson();

		List<StudentBean> studentlist = services.listsOfStudent();

		String userJson = gson.toJson(studentlist);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		out.print(userJson);
		out.close();
	}

}
