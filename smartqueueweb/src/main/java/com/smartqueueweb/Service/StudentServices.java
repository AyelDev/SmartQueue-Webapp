package com.smartqueueweb.Service;

import com.smartqueueweb.Model.StudentBean;
import java.util.List;

public interface StudentServices{
	
	Integer addStudent(long idnumber, String firstname, String middlenmae, String lastname, String course);
	 
	List<StudentBean> listsOfStudent();

	Integer deleteStudent(long idnumber);
}
