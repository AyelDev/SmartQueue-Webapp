package com.smartqueueweb.Test;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.smartqueueweb.DAO.smartqueue_DataAccessLayer;

public class Login_Test {

	@Test
	public void test() {
		String User = "testuser";
		String Pass = "testpass";
		smartqueue_DataAccessLayer database = new smartqueue_DataAccessLayer();
		assertTrue(database.Login(User, Pass));
	}

}
