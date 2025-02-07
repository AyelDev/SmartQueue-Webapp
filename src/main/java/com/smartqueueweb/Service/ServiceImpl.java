package com.smartqueueweb.Service;

import java.io.InputStream;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.smartqueueweb.Class.ServiceType;
import com.smartqueueweb.DAO.AdminDAO;
import com.smartqueueweb.DAO.StaffDAO;
import com.smartqueueweb.DAO.StudentDAO;
import com.smartqueueweb.Model.AdminBean;
import com.smartqueueweb.Model.CountersBean;
import com.smartqueueweb.Model.MediaBean;
import com.smartqueueweb.Model.MonthQueueSummaryBean;
import com.smartqueueweb.Model.QueueEntryBean;
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
	public Integer registerStaff(String firstname, String lastname, String email, String contactNumber,
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
	
	@Override
	public Integer addVideo(String fileName, String path, String type) {
		// TODO Auto-generated method stub
		return staffdata.addVideo(fileName, path, type);
	}

	@Override
	public Integer setStaffPin(String pin, int id) {
		// TODO Auto-generated method stub
		return staffdata.SetStaffPin(pin, id);
	}

	@Override
	public Boolean resetPasswordStep1(String email) {
		// TODO Auto-generated method stub
		return staffdata.ResetPasswordStep1(email);
	}

	@Override
	public StaffBean resetPasswordStep2(String pin, String email) {
		// TODO Auto-generated method stub
		return staffdata.ResetPasswordStep2(pin, email);
	}
	
	@Override
	public Boolean completePasswordReset(String password, int id) {
		// TODO Auto-generated method stub
		return staffdata.CompletePasswordReset(password, id);
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
	
	@Override
	public Integer addService(String program, String purpose, int amount, ServiceType serviceType) {
		// TODO Auto-generated method stub
		return admindata.AddService(program, purpose, amount, serviceType);
	}
	
	@Override
	public Boolean updateService(Integer id, String program, String purpose, int amount) {
		// TODO Auto-generated method stub
		return admindata.UpdateService(id, program, purpose, amount);
	}

	@Override
	public Boolean deleteService(Integer id) {
		// TODO Auto-generated method stub
		return admindata.DeleteService(id);
	} 
	
	@Override
	public Integer addCounters(Integer counterNumber, String description) {
		// TODO Auto-generated method stub
		return admindata.AddCounters(counterNumber, description);
	}
	
	@Override
	public List<CountersBean> counterList() {
		// TODO Auto-generated method stub
		return admindata.CounterList();
	}

	@Override
	public Boolean updateCounters(Integer id, Integer counterNumber, String description, String status) {
		// TODO Auto-generated method stub
		return admindata.UpdateCounters(id, counterNumber, description, status);
	}

	@Override
	public Boolean deleteCounters(Integer id) {
		// TODO Auto-generated method stub
		return admindata.DeleteCounters(id);
	}
	
	@Override
	public List<MediaBean> videoList() {
		// TODO Auto-generated method stub
		return admindata.VideoList();
	}

	@Override
	public List<QueueEntryBean> listOfEnquiries() {
		// TODO Auto-generated method stub
		return admindata.ListOfEnquiries();
	}

	@Override
	public List<MonthQueueSummaryBean> listOfMonthlyQueues() {
		// TODO Auto-generated method stub
		return admindata.ListOfMonthlyQueues();
	}

	@Override
	public Integer addMonthlyEnquiry() {
		// TODO Auto-generated method stub
		return admindata.AddMonthlyEnquiry();
	}

	@Override
	public Boolean clearAllQueueEntries() {
		// TODO Auto-generated method stub
		return admindata.ClearAllQueueEntries();
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
	public Integer addToQueue(String queueNumber, String idNumber, String fullname, String purpose, String servicetype) {
		return studentdata.addToQueue(queueNumber, idNumber, fullname, purpose, servicetype);
	}

	@Override
	public Long queueNumberAvailable(long id) {
		// TODO Auto-generated method stub
		return studentdata.queueNumberAvailable(id);
	}
	
	@Override
	public Integer tempRegisterStudent(String idNumber, String firstname, String middlename, String lastname,
			String course) {
		// TODO Auto-generated method stub
		return studentdata.tempRegisterStudent(idNumber, firstname, middlename, lastname, course);
	}
	
	public String XMLERRORNAME(String errorName) {
		try {
			
			InputStream xmlFile = ServiceImpl.class.getClassLoader().getResourceAsStream("WEB-INF/WebConfigErrors.xml");

		    // Check if file exists
		    if (xmlFile == null) {
		        System.out.println("File not found: " + xmlFile);
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
