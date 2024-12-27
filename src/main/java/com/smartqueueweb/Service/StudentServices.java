package com.smartqueueweb.Service;

import java.util.List;

import com.smartqueueweb.Model.StudentBean;

public interface StudentServices{
	
	Integer addStudent(long idnumber, String firstname, String middlename, String lastname, String course);
	 
	List<StudentBean> listsOfStudent();

	Integer deleteStudent(long idnumber);

	Integer updateStudent(long idNumber, long inputIdnumber, String inputfirstname, String inputMiddlename, String inputLastname, String inputCourse);

	Integer addToQueue(String queueNumber, long idNumber, String fullname, String purpose, String servicetype);
	
	StudentBean searchStudentInquiry(long idnumber, String firstname, String middlename, String lastname);
	
	Long queueNumberAvailable(long id);
	
	StudentBean registerStudentTemp(String idNumber, String firstname, String middlename, String lastname, String course);	
}
