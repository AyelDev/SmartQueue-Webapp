package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.DAO.SQLConnection;

public class SQLConnection_Test {

	@Test
	public void test() {
	SQLConnection data = new SQLConnection();
		assertNotNull(data.conn);
	
	}

}
