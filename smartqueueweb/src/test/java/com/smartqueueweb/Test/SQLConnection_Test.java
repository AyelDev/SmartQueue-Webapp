package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.DAO.smartqueue_DataAccessLayer;

public class SQLConnection_Test {

	@Test
	public void test() {
	smartqueue_DataAccessLayer data = new smartqueue_DataAccessLayer();
		
		assertNotNull(data.conn);
	
	}

}
