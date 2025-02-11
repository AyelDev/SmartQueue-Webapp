package com.smartqueueweb.Controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smartqueueweb.Model.AdminBean;
import com.smartqueueweb.Model.StaffBean;

@WebServlet("/myimage")
public class MyImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Enumeration<String> attributeNames = null;
	StaffBean staffBean = null;
	AdminBean adminBean = null;
	byte[] ByteArray = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session != null) {
			attributeNames = session.getAttributeNames();
		} else {
			response.getWriter().write("session null");
			return;
		}

		if (!attributeNames.hasMoreElements()) {
			response.getWriter().write("No session attributes found.");
			return;
		} else {

			while (attributeNames.hasMoreElements()) {

				String attributeName = attributeNames.nextElement();

				Object attributeValue = session.getAttribute(attributeName);

				if (attributeValue instanceof StaffBean && attributeName.equals("sessionStaff")) {
					
					staffBean = (StaffBean) attributeValue;
					
					ByteArray = GetImageByte(staffBean.getProfilePicture());
				}

				if (attributeValue instanceof AdminBean && attributeName.equals("sessionAdmin")) {
					
					adminBean = (AdminBean) attributeValue;
					
					ByteArray = GetImageByte(adminBean.getProfilePicture());
				}

				response.setContentType("image/gif");
				OutputStream os = response.getOutputStream();
				os.write(ByteArray);
				os.flush();
				os.close();

			}

		}

	}

	public byte[] GetImageByte(Blob imageBlob) {
		
		try {
			
			return imageBlob.getBytes(1, (int) imageBlob.length());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;

	}

}
