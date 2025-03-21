package com.smartqueueweb.Service;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import com.smartqueueweb.Model.ServicesBean;
import com.smartqueueweb.Model.StaffBean;

public interface StaffServices {

	boolean loginStaff(String username, String password);
	
	//staff can register but unable to use (need verification to the admin)
	Integer registerStaff(String firstname, String lastname, String email, String contactNumber,
			String username);
	
	StaffBean loginStaffDetail(String username);
	
	Boolean isStaffLocked(String username);
	
	List<StaffBean> listsOfStaff();

	Integer GenerateStaffToken(String role, String value);
	
	Integer deleteStaff(long staffId);

	Integer updateStaff(long staffId, String inputFirstname, String inputLastname, String inputEmail, String inputContactnumber, String inputUsername ,String inputPassword, int inputStafflocked);

	Integer requestStaffPassword(String username, String email);
	
	List<StaffBean> listOfStaffPasswordRequests(int isCompleted);
	
	List<ServicesBean> windowList();
	
	List<ServicesBean> studentQueueEntries(int window_number, String queue_status);
	
	Integer updateQueueStatus(String QueueNumber, String queue_status);
	
	Integer addVideo(String fileName, String path, String type);

	Integer setStaffPin(String pin, int id);

	Boolean resetPasswordStep1(String email);

	StaffBean resetPasswordStep2(String pin, String email);
	
	Boolean completePasswordReset(String password, int id);
	
	Boolean staffChangeProfilePhoto(InputStream file, int id) throws SQLException;
}
