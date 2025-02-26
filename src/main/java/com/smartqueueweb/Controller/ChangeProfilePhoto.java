package com.smartqueueweb.Controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.smartqueueweb.Model.AdminBean;
import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/ChangeProfilePhoto")
public class ChangeProfilePhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final long MAX_FILE_SIZE = 40 * 1024 * 1024; // 40 MiB per file

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sf = new ServletFileUpload(factory);
		Enumeration<String> attributeNames;
		StaffBean staffBean;
		AdminBean adminBean;
		byte[] ByteArray;
		HttpSession session;
		InputStream inputStream;
		ServiceImpl service = new ServiceImpl();
		boolean isUploaded = false;

		session = request.getSession(false);

		try {
			List<FileItem> multifiles = sf.parseRequest(request);
			if (multifiles.isEmpty()) {
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				response.getWriter().write("payload empty/null");
				return;
			}

			var firstFile = multifiles.get(0);

			if (firstFile.getSize() > MAX_FILE_SIZE) {
				response.setStatus(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE);
				response.getWriter().write("Must be 40 MiB per file.");
				return;
			}

			if (session != null) {
				attributeNames = session.getAttributeNames();
			} else {
				response.setStatus(HttpServletResponse.SC_FORBIDDEN);
				response.getWriter().write("session null");
				return;
			}

			if (!attributeNames.hasMoreElements()) {
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				response.getWriter().write("No session attributes found.");
				return;

			} else {

				String attributeName = attributeNames.nextElement();
				Object attributeValue = session.getAttribute(attributeName);

				if (attributeValue instanceof StaffBean && attributeName.equals("sessionStaff")) {

					staffBean = (StaffBean) attributeValue;

					isUploaded = service.staffChangeProfilePhoto(firstFile.getInputStream(), staffBean.getStaffID());
				}

				if (attributeValue instanceof AdminBean && attributeName.equals("sessionAdmin")) {

					adminBean = (AdminBean) attributeValue;

					isUploaded = service.adminChangeProfilePhoto(firstFile.getInputStream(), adminBean.getAdminId());

				}

				if (isUploaded)
					response.setStatus(HttpServletResponse.SC_OK);
				else
					response.setStatus(HttpServletResponse.SC_BAD_REQUEST);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}

	}

}
