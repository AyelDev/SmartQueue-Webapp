package com.smartqueueweb.DAO;

public class StudentDAO extends SQLConnection{
	
	public StudentDAO() {
	super();	
	}


	public Integer addStudent(long idNumber, String firstname, String lastname){
		try{
			ConnectDriver();
			prs = conn.prepareStatement("INSERT INTO tbl_student_info (id_number, first_name, last_name) VALUES (?,?,?)");
			prs.setLong(1, idNumber);
			prs.setString(2, firstname);
			prs.setString(3, lastname);

			return prs.executeUpdate();

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			SQLClose();
		}
		return 0;
	}
}
