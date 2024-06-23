package com.smartqueueweb.Service;

import com.smartqueueweb.DAO.smartqueue_DataAccessLayer;

public class AuthenticationImp implements Authentication {
	private smartqueue_DataAccessLayer data = new smartqueue_DataAccessLayer();

	@Override
	public Boolean loginStaff(String username, String password) {
		return data.Login(username, password);
	}

}
