package com.smartqueueweb.DAO;

import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import com.smartqueueweb.Class.ServiceType;
import com.smartqueueweb.Model.AdminBean;
import com.smartqueueweb.Model.ServicesBean;

public class AdminDAO extends SQLConnection {

	AdminBean adminbean = null;
	ServicesBean serviceBean = null;
	List<ServicesBean> serviceBeanList = null;

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

	public Integer addService(String program, String purpose, int amount, ServiceType serviceType) {
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

}
