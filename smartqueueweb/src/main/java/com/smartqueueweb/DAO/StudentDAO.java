package com.smartqueueweb.DAO;

import java.util.List;
import java.util.ArrayList;
import com.smartqueueweb.Model.StudentBean;

public class StudentDAO extends SQLConnection{
	
	StudentBean studentbean = null;

	public StudentDAO() {
	super();	
	}


	public Integer addStudent(long idNumber, String firstname, String middlename, String lastname, String course){
		try{
			ConnectDriver();
			prs = conn.prepareStatement("INSERT INTO tbl_student_info (id_number, first_name, middle_name, last_name, course) VALUES (?,?,?,?,?)");
			prs.setLong(1, idNumber);
			prs.setString(2, firstname);
			prs.setString(3, middlename);
			prs.setString(4, lastname);
			prs.setString(5, course);

			return prs.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			SQLClose();
		}
		return 0;
	}

	List<StudentBean> listOfStudent = null;
	public List<StudentBean> listOfStudent(){
		try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT * FROM tbl_student_info WHERE isDeleted=0");
			rs = prs.executeQuery();
			listOfStudent = new ArrayList<StudentBean>();

			while(rs.next()){
				studentbean = new StudentBean(rs.getInt("id_number"), 
				rs.getString("first_name"), 
				rs.getString("middle_name"), 
				rs.getString("last_name"), 
				rs.getString("course"));
				listOfStudent.add(studentbean);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			SQLClose();
		}
		return listOfStudent;
	}

	public Integer removeStudent(long idNumber){
		try{
			ConnectDriver();
			prs = conn.prepareStatement("UPDATE `tbl_student_info` SET `isDeleted` = '1' WHERE `tbl_student_info`.`id_number` = ?");
			prs.setLong(1, idNumber);

			return prs.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			SQLClose();
		}
		return 0;
	}

	
	public Integer updateStudent(long idNumber, long inputIdnumber, String inputfirstname, String inputMiddlename, String inputLastname, String inputCourse){
		try {
			ConnectDriver();
			prs = conn.prepareStatement("UPDATE `tbl_student_info` SET `id_number` = ?, `first_name` = ?,"+
			" `middle_name` = ?, `last_name` = ?, `course` = ? WHERE `tbl_student_info`.`id_number` = ?;");
			prs.setLong(1, inputIdnumber);
			prs.setString(2, inputfirstname);
			prs.setString(3, inputMiddlename);
			prs.setString(4, inputLastname);
			prs.setString(5, inputCourse);
			prs.setLong(6, idNumber);
			
			return prs.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			SQLClose();
		}
		return 0;
	}
}
