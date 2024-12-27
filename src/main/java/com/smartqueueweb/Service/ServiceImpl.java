package com.smartqueueweb.Service;

import java.io.File;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.smartqueueweb.DAO.AdminDAO;
import com.smartqueueweb.DAO.StaffDAO;
import com.smartqueueweb.DAO.StudentDAO;
import com.smartqueueweb.Model.AdminBean;
import com.smartqueueweb.Model.ServicesBean;
import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Model.StudentBean;

public class ServiceImpl implements StaffServices, StudentServices, AdminServices {
	StaffDAO staffdata = new StaffDAO();
	AdminDAO admindata = new AdminDAO();
	StudentDAO studentdata = new StudentDAO();

	//////////////////////////////////////////////////////////////////////// ------------------
	//////////////////////////////////////////////////////////////////////// Staff
	@Override
	public boolean loginStaff(String username, String password) {
		// TODO Auto-generated method stub
		return staffdata.authLoginStaff(username, password);
	}

	@Override
	public Integer registerStaff(String firstname, String lastname, String email, double contactNumber,
			String username) {
		// TODO Auto-generated method stub
		return staffdata.registerStaff(firstname, lastname, email, contactNumber, username);
	}

	@Override
	public StaffBean loginStaffDetail(String username) {
		// TODO Auto-generated method stub
		return staffdata.staffDetails(username);
	}

	@Override
	public Boolean isStaffLocked(String username) {
		// TODO Auto-generated method stub
		return staffdata.checkStaffIfLocked(username);
	}

	@Override
	public List<StaffBean> listsOfStaff() {
		// TODO Auto-generated method stub
		return staffdata.listOfStaff();
	}

	@Override
	public Integer GenerateStaffToken(String role, String value) {
		// TODO Auto-generated method stub
		return staffdata.GenerateToken(role, value);
	}

	@Override
	public Integer deleteStaff(long staffId) {
		// TODO Auto-generated method stub
		return staffdata.removeStaff(staffId);
	}
	
	@Override
	public List<StaffBean> listOfStaffPasswordRequests(int isCompleted) {
		// TODO Auto-generated method stub
		return staffdata.listOfStaffPasswordRequest(isCompleted);
	}

	@Override
	public Integer updateStaff(long staffId, String inputFirstname, String inputLastname, String inputEmail,
			double inputContactnumber, String inputUsername, String inputPassword, int inputStafflocked) {
		// TODO Auto-generated method stub
		return staffdata.updateStaff(staffId, inputFirstname, inputLastname, inputEmail, inputContactnumber,
				inputUsername, inputPassword, inputStafflocked);
	}

	@Override
	public Integer requestStaffPassword(String username, String email) {
		// TODO Auto-generated method stub
		return staffdata.requestStaffPassword(username, email);
	}

	@Override
	public List<ServicesBean> windowList() {
		// TODO Auto-generated method stub
		return staffdata.windowList();
	}
	
	@Override
	public List<ServicesBean> studentQueueEntries(int window_number, String queue_status) {
		// TODO Auto-generated method stub
		return staffdata.studentQueueEntries(window_number, queue_status);
	}
	
	@Override
	public Integer updateQueueStatus(String QueueNumber, String queue_status) {
		// TODO Auto-generated method stub
		return staffdata.updateQueueStatus(QueueNumber, queue_status);
	}
	
	//////////////////////////////////////////////////////////////////////// --------------------
	//////////////////////////////////////////////////////////////////////// Admin
	@Override
	public boolean loginAdmin(String username, String password) {
		// TODO Auto-generated method stub
		return admindata.authLoginAdmin(username, password);
	}

	@Override
	public AdminBean adminDetails(String username) {
		// TODO Auto-generated method stub
		return admindata.adminDetail(username);
	}

	@Override
	public List<ServicesBean> serviceList() {
		// TODO Auto-generated method stub
		return admindata.serviceList();
	}

	//////////////////////////////////////////////////////////////////////// -----------------------
	//////////////////////////////////////////////////////////////////////// Student

	@Override
	public Integer addStudent(long idnumber, String firstname, String middlename, String lastname, String course) {
		return studentdata.addStudent(idnumber, firstname, middlename, lastname, course);
	}

	@Override
	public List<StudentBean> listsOfStudent() {
		// TODO Auto-generated method stub
		return studentdata.listOfStudent();
	}

	@Override
	public Integer deleteStudent(long idnumber) {
		// TODO Auto-generated method stub
		return studentdata.removeStudent(idnumber);
	}

	@Override
	public Integer updateStudent(long idNumber, long inputIdnumber, String inputfirstname, String inputMiddlename,
			String inputLastname, String inputCourse) {
		// TODO Auto-generated method stub
		return studentdata.updateStudent(idNumber, inputIdnumber, inputfirstname, inputMiddlename, inputLastname,
				inputCourse);
	}
	
	@Override
	public StudentBean searchStudentInquiry(long idnumber, String firstname, String middlename, String lastname) {
		return studentdata.searchStudentDetail(idnumber, firstname, middlename, lastname);
	}
	
	@Override
	public Integer addToQueue(String queueNumber, long idNumber, String fullname, String purpose, String servicetype) {
		return studentdata.addToQueue(queueNumber, idNumber, fullname, purpose, servicetype);
	}

	@Override
	public Long queueNumberAvailable(long id) {
		// TODO Auto-generated method stub
		return studentdata.queueNumberAvailable(id);
	}
	
	@Override
	public StudentBean registerStudentTemp(String idNumber, String firstname, String middlename, String lastname,
			String course) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String XMLERRORNAME(String errorName) {
		try {
		    // Specify the file path
		    File xmlFile = new File("src/main/webapp/WEB-INF/WebConfigErrors.xml");

		    // Check if file exists
		    if (!xmlFile.exists()) {
		        System.out.println("File not found: " + xmlFile.getAbsolutePath());
		        return "";
		    }

		    // Create a DocumentBuilderFactory
		    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

		    // Create a DocumentBuilder
		    DocumentBuilder builder = factory.newDocumentBuilder();

		    // Parse the XML file and build a Document
		    Document document = builder.parse(xmlFile);

		    // Normalize the XML structure
		    document.getDocumentElement().normalize();

		    // Get all data elements
		    NodeList nodeList = document.getElementsByTagName("data");

		    // Iterate through the data elements
		    for (int i = 0; i < nodeList.getLength(); i++) {
		        Element dataElement = (Element) nodeList.item(i);
		        String value = dataElement.getElementsByTagName("value").item(0).getTextContent();
		        String name = dataElement.getAttribute("name");
		        if (name.equals(errorName)) {
		            // Print the information
		            // System.out.println("Name: " + name);
		            // System.out.println("Value: " + value);
		            // System.out.println();
		            return value;
		        }
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return "";

	}

}
