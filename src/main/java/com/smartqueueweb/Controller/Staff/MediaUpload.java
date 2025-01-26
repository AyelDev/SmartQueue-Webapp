package com.smartqueueweb.Controller.Staff;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.smartqueueweb.Service.ServiceImpl;

@WebServlet("/MediaUpload")
@MultipartConfig
public class MediaUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final long MAX_FILE_SIZE = 100 * 1024 * 1024; // 500 mb per file
	private static final String ALLOWED_VIDEO_TYPES = "video/mp4,video/avi,video/mkv,video/mov,video/flv";
	private static final List<String> allowedTypes = new ArrayList<String>(Arrays.asList(ALLOWED_VIDEO_TYPES.split(",")));
	private static final String UPLOAD_DIR = "/smartqueue/temp/uploads";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{	
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sf = new ServletFileUpload(factory);
		String fileName;
		String filePath;
		File uploadedFile;
		File mediaDir;
		int isVideoAdded = 0;
		ServiceImpl service = new ServiceImpl();

		 String realPath = getServletContext().getRealPath("/media");
		// System.out.println(realPath);

		try {
			List<FileItem> multifiles = sf.parseRequest(request);
			 for (FileItem file : multifiles) {
			        if (!file.isFormField()) { // Check if the item is a file (not a regular form field)
			        		
			        	if(file.getSize() > MAX_FILE_SIZE) {
			        		response.setStatus(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE);
			        		response.getWriter().write("Must be 100 mb per file.");
			        		return;
			        	}
			        	
			        	if(!allowedTypes.contains(file.getContentType())) {
			        		response.setStatus(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE);
			        		response.getWriter().write("Must be video file type.");
			        		return;
			        	}
			        	
			        	fileName = file.getName();
			            
			            filePath = realPath + File.separator + fileName;
			            
			            uploadedFile = new File(filePath);
			            
			            // Create the folder if it doesn't exist
			            mediaDir = new File(realPath);
			            
			            if (!mediaDir.exists()) {
			                mediaDir.mkdirs();
			            }
						
						isVideoAdded = service.addVideo(file.getName(), realPath, file.getContentType());

			           if(isVideoAdded < 1)
						throw new SQLIntegrityConstraintViolationException();
				
			        	
						file.write(uploadedFile);
			            System.out.println("Uploaded file to: " + uploadedFile.getAbsolutePath());
			        }
			        
			    }
			    response.setStatus(HttpServletResponse.SC_CREATED);
				response.getWriter().write("Upload successful.");
				
		} catch (FileUploadException e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("The file may be corrupted; please try again.");
			e.printStackTrace();
		} catch (SQLIntegrityConstraintViolationException e){
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("This file has already been uploaded.");
		}catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("The server encountered an issue.");
			e.printStackTrace();
		}
	}

}
