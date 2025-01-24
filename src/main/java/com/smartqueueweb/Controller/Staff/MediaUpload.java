package com.smartqueueweb.Controller.Staff;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;




@WebServlet("/MediaUpload")
public class MediaUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(this.getServletContext().getRealPath(getServletInfo()) + File.separator);

		try {
			ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
			List<FileItem> multipleFiles = sfu.parseRequest(request);
			
			System.out.println("filename" + multipleFiles.get(0).getName());
			
			
			for(FileItem fileItem : multipleFiles) {
				fileItem.write(new File("/Users/63966/git/smartqueueweb/" + fileItem.getName()));
				System.out.println("name is : " + fileItem.getName());
			}
			
			System.out.println("done");
			
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
