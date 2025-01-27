package com.smartqueueweb.Controller.Admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smartqueueweb.Model.CountersBean;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/CounterlistApi")
public class Counterlist_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    List<CountersBean> counterBeanList = null;
    ServiceImpl service = null;
    HttpSession session = null;
    RequestDispatcher dispatcher = null;
    public Counterlist_Servlet() {
        super();
        service = new ServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json");
		Gson gson = new Gson();
		
		counterBeanList = service.counterList();
		String toJsonString = gson.toJson(counterBeanList);
		
		response.getWriter().write(toJsonString);
		response.getWriter().flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int counterNumber = Integer.parseInt(request.getParameter("txtCounterno"));	
		String description = request.getParameter("txtDescription");
		response.setContentType("text/plain");
		
		try {
			int isCounterAdded = service.addCounters(counterNumber, description);
			
			if(isCounterAdded < 0)
				throw new Exception();
			
			response.setStatus(HttpServletResponse.SC_CREATED);
			response.getWriter().write("Added Successfully");
			
		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("Something went wrong try again");
		}
	}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    
	    try {
	    //jsonReader is created method [see below]
	    String jsonString = jsonReader(request).toString();
	    
	    Gson gson = new Gson();
	    CountersBean counterlistBean = gson.fromJson(jsonString, CountersBean.class);
	    
		boolean isCounterAdded = service.updateCounters
		(counterlistBean.getId(),
		counterlistBean.getCounterNumber(), 
		counterlistBean.getDescription(), 
		counterlistBean.getStatus());
		
			if(!isCounterAdded)
				throw new Exception();
			
		    response.setStatus(HttpServletResponse.SC_OK);
	        response.getWriter().write("{\"status\": \"success\", \"message\": \"Updated Successfully\"}");
		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("Something went wrong try again");
		}
	}

protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
	try {
		
		String jsonString = jsonReader(request).toString();
		
	    Gson gson = new Gson();
	    CountersBean counterlistBean = gson.fromJson(jsonString, CountersBean.class);
		 
		boolean isCounterAdded = service.deleteCounters(counterlistBean.getId());
		
		if(!isCounterAdded)
			throw new Exception();
		
		 response.setStatus(HttpServletResponse.SC_OK);
	     response.getWriter().write("{\"status\": \"success\", \"message\": \"Deleted Successfully\"}");
		
	} catch (Exception e) {
		response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		response.getWriter().write("Something went wrong try again");
	}
}

protected StringBuilder jsonReader(HttpServletRequest request) throws IOException {
	
	BufferedReader reader = request.getReader();
    StringBuilder jsonBuilder = new StringBuilder();
    String line;
    while ((line = reader.readLine()) != null) {
        jsonBuilder.append(line);
    }
    
    return jsonBuilder;
}
	
	

}
