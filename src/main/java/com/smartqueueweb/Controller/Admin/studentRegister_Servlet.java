package com.smartqueueweb.Controller.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartqueueweb.Class.JwtValidator;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/studentRegister_Servlet")
public class studentRegister_Servlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  ServiceImpl services = new ServiceImpl();
  RequestDispatcher rd = null;

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    // Retrieve the parameters from the request
    String firstName = JwtValidator.fixGarbledCharacters(request.getParameter("txtFirstname"));
    String middleName = JwtValidator.fixGarbledCharacters(request.getParameter("txtMiddlename"));
    String lastName = JwtValidator.fixGarbledCharacters(request.getParameter("txtLastname"));
    String course = JwtValidator.fixGarbledCharacters(request.getParameter("purpose"));
    String idNumber = JwtValidator.fixGarbledCharacters(request.getParameter("txtIdnumber"));

    // Call the service to register staff
    try {
      int isTrue = services.addStudent(Long.parseLong(idNumber), firstName, middleName, lastName, course);
      if (isTrue >= 1) {
        response.setContentType("text/plain");
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().write("Registration successful.");
      } else {
        throw new Exception();
      }

    } catch (Exception e) {
      response.setContentType("text/plain");
      response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
      response.getWriter().write("Registration failed.");
    }
  }

}
