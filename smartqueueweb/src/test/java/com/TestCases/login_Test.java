package com.TestCases;

import static org.junit.Assert.*;

import org.junit.Test;

import com.sqModel.smartqueue_DataAccessLayer;

public class login_Test {

	@Test
	public void test() {
		smartqueue_DataAccessLayer database = new smartqueue_DataAccessLayer();

		String expected = null;
		String actual = database.conn.toString();
		
		assertNotEquals(expected, actual);
	}

}
