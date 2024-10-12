package com.smartqueueweb.Service;

import com.smartqueueweb.Model.StudentBean;
import java.util.List;

public interface StudentServices{
	
	Integer addStudent(long idnumber, String firstname, String middlename, String lastname, String course);
	 
	List<StudentBean> listsOfStudent();

	Integer deleteStudent(long idnumber);

	Integer updateStudent(long idNumber, long inputIdnumber, String inputfirstname, String inputMiddlename, String inputLastname, String inputCourse);

	Integer addToQueue(String queueNumber, int idNumber, String fullname, String purpose, String servicetype);
}
