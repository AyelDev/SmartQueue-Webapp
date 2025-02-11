package com.smartqueueweb.DAO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smartqueueweb.Class.ServiceType;
import com.smartqueueweb.Model.AdminBean;
import com.smartqueueweb.Model.CountersBean;
import com.smartqueueweb.Model.MediaBean;
import com.smartqueueweb.Model.MonthQueueSummaryBean;
import com.smartqueueweb.Model.QueueEntryBean;
import com.smartqueueweb.Model.ServicesBean;

public class AdminDAO extends SQLConnection {

	AdminBean adminbean = null;
	ServicesBean serviceBean = null;
	CountersBean countersBean = null;
	MediaBean mediaBean = null;
	QueueEntryBean queueEntryBean = null;
	MonthQueueSummaryBean monthQueueSummaryBean = null;
 	
	List<ServicesBean> serviceBeanList = null;
	List<CountersBean> countersBeanList = null;
	List<MediaBean> mediaBeanList = null;
	List<QueueEntryBean> queueEntryBeanList = null;
	List<MonthQueueSummaryBean> monthQueueSummaryBeanList = null;


	public AdminDAO() {
		super();
	}

	public boolean authLoginAdmin(String username, String password) {
		try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT username FROM tbl_login_admin WHERE username=? AND password=?");
			prs.setString(1, username);
			prs.setString(2, password);
			rs = prs.executeQuery();

			return rs.next();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			SQLClose();
		}
	}

	public AdminBean adminDetail(String username) {

		try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT * FROM tbl_login_admin WHERE username=?");
			prs.setString(1, username);
			rs = prs.executeQuery();

			while (rs.next()) {
				adminbean = new AdminBean();
				adminbean.setAdminId(rs.getInt("admin_id"));
				adminbean.setUsername(rs.getString("username"));
				adminbean.setPassword(rs.getString("password"));
				adminbean.setProfilePicture(rs.getBlob("profile_picture"));
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			SQLClose();
		}
		return adminbean;
	}

	public List<ServicesBean> serviceList() {

		try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT * FROM tbl_service");
			//prs.setString(1, servicetype);
			rs = prs.executeQuery();
			serviceBeanList = new ArrayList<ServicesBean>();

			while (rs.next()) {
				serviceBean = new ServicesBean(rs.getInt("id"), rs.getString("purpose"), rs.getString("program"), rs.getInt("amount"), rs.getString("servicetype"));
				serviceBeanList.add(serviceBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQLClose();
		}
		return serviceBeanList;
	}

	public Integer AddService(String program, String purpose, int amount, ServiceType serviceType) {
		// TODO Auto-generated method stub
		try {
			ConnectDriver();
			prs = conn.prepareStatement("INSERT INTO tbl_service (program, purpose, amount, servicetype) VALUES (?, ?, ?, ?);");
			prs.setString(1, program);
			prs.setString(2, purpose);
			prs.setInt(3, amount);
			prs.setString(4, serviceType.toString());

			return prs.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQLClose();
		}
		return 0;
	}

	public Boolean UpdateService(Integer id, String program, String purpose, int amount) {
		// TODO Auto-generated method stub
		try {
			ConnectDriver();
			prs = conn.prepareStatement("UPDATE tbl_service SET program = ?, purpose = ?, amount = ? WHERE tbl_service.id = ?;");
			prs.setString(1, program);
			prs.setString(2, purpose);
			prs.setInt(3, amount);
			prs.setInt(4, id);
			
			if(prs.executeUpdate() == 1)
				return true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			SQLClose();
		}
		return false;
	}

	public Boolean DeleteService(Integer id) {
		// TODO Auto-generated method stub
		try {
			ConnectDriver();
			prs = conn.prepareStatement("DELETE FROM tbl_service WHERE tbl_service.id = ?");
			prs.setInt(1, id);
			
			if(prs.executeUpdate() == 1) 
				return true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			SQLClose();
		}
		return false;
	}
	
	public Integer AddCounters(int counterNumber, String description) {
		try {
			ConnectDriver();
			prs = conn.prepareStatement("INSERT INTO `tbl_counters` (counter_number, description) VALUES (?, ?);");
			prs.setInt(1, counterNumber);
			prs.setString(2, description);
			return prs.executeUpdate();
			
		}catch (Exception e) {
			
		}finally {
			SQLClose();
		}
		return null;
	}

	public List<CountersBean> CounterList() {
		// TODO Auto-generated method stub
		try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT * from tbl_counters ORDER BY counter_number");
			rs = prs.executeQuery();
			countersBeanList = new ArrayList<CountersBean>();

			while (rs.next()) {
				countersBean = new CountersBean(
								rs.getInt("id"), 
								rs.getInt("counter_number"),
								rs.getString("description"), 
								rs.getDate("date_created"), 
								rs.getString("status"));
				countersBeanList.add(countersBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQLClose();
		}
		return countersBeanList;
	}

	public Boolean UpdateCounters(Integer id, Integer counterNumber, String description, String status) {
		
		try {
			ConnectDriver();
			prs = conn.prepareStatement("UPDATE tbl_counters SET counter_number = ?, description = ?, status = ? WHERE tbl_counters.id = ?");
			prs.setInt(1, counterNumber);
			prs.setString(2, description);
			prs.setString(3, status);
			prs.setInt(4, id);
			
			if(prs.executeUpdate() == 1)
				return true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			SQLClose();
		}
		return false;
	}

	public Boolean DeleteCounters(int id) {
		
		try {
			ConnectDriver();
			prs = conn.prepareStatement("DELETE FROM tbl_counters WHERE tbl_counters.id = ?");
			prs.setInt(1, id);
			
			int rowsAffected = prs.executeUpdate();
			
			if(rowsAffected > 0)
				return true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			SQLClose();
		}
		return false;
	}

	public List<MediaBean> VideoList() {
		// TODO Auto-generated method stub
		try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT * from tbl_media ORDER BY fileName");
			rs = prs.executeQuery();
			mediaBeanList = new ArrayList<MediaBean>();

			while (rs.next()) {
				mediaBean = new MediaBean(
						rs.getInt("id"), 
						rs.getString("filename"),
						rs.getString("path"), 
						rs.getString("type")
						);
				mediaBeanList.add(mediaBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQLClose();
		}
		return mediaBeanList;
	}

    public List<QueueEntryBean> ListOfEnquiries() {

		try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT * FROM student_queue_entries ORDER BY id");
			rs = prs.executeQuery();
			queueEntryBeanList = new ArrayList<QueueEntryBean>();

			while (rs.next()) {
				queueEntryBean = new QueueEntryBean(
						rs.getInt("id"), 
						rs.getString("queue_number"),
						rs.getString("id_number"), 
						rs.getString("fullname"), 
						rs.getString("purpose"), 
						rs.getString("serviceType"), 
						rs.getInt("window_number"), 
						rs.getDate("date"), 
						rs.getString("queue_status")
						);
				queueEntryBeanList.add(queueEntryBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQLClose();
		}
		return queueEntryBeanList;
        
    }

    public List<MonthQueueSummaryBean> ListOfMonthlyQueues() {
       
    	try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT * FROM tbl_month_queue_summary ORDER BY id");
			rs = prs.executeQuery();
			monthQueueSummaryBeanList = new ArrayList<MonthQueueSummaryBean>();

			while (rs.next()) {
				monthQueueSummaryBean = new MonthQueueSummaryBean(
						rs.getInt("id"), 
						rs.getDate("month"),
						rs.getInt("inquiries"), 
						rs.getDate("date_modified")
						);
				monthQueueSummaryBeanList.add(monthQueueSummaryBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQLClose();
		}
		return monthQueueSummaryBeanList;
        
    }

    public Integer AddMonthlyEnquiry() {
		try {
			ConnectDriver();
			prs = conn.prepareStatement("UPDATE tbl_month_queue_summary SET inquiries = inquiries + 1 WHERE MONTH(month) = MONTH(CURDATE());");
			return prs.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQLClose();
		}
		return 0;
    }

    public Boolean ClearAllQueueEntries() {
        // TODO Auto-generated method stub
			try {
				ConnectDriver();
				prs = conn.prepareStatement("DELETE from student_queue_entries WHERE date < CURDATE();");
				
				if(prs.executeUpdate() > 0);
				return true;
			
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				SQLClose();
			}
		return false;
	}

	public Boolean UpdateAdmin(Integer id, String username, String password) throws SQLException {
		
		try {
			ConnectDriver();
			prs = conn.prepareStatement("UPDATE tbl_login_admin SET username = ?, password = ? WHERE tbl_login_admin.admin_id = ?;");
			
			prs.setString(1, username);
			prs.setString(2, password);
			prs.setInt(3, id);
			
			int isExecuteUpdate = prs.executeUpdate();
			
			if(isExecuteUpdate > 0)
				return true;
			
		} finally {
			SQLClose();
		}
		return false;
	}
}