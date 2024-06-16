package sqController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sqModel.smartqueue_DataAccessLayer;



@WebServlet("/login_Servlet")
public class login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	smartqueue_DataAccessLayer database = new smartqueue_DataAccessLayer();
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		  String userName = request.getParameter("txtUsername"); String passWord =
		  request.getParameter("txtPassword");
		  
		  PrintWriter out = response.getWriter();
		  
		  database.Login(userName, passWord);
		  if(!database.Login(userName, passWord)) out.print("login failed"); else
		  out.println("login successful");
		 
	}

}
