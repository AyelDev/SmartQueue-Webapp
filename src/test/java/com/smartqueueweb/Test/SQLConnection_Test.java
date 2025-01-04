package com.smartqueueweb.Test;

import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;

import org.junit.Test;

import com.smartqueueweb.DAO.SQLConnection;

public class SQLConnection_Test {

	@Test
	public void test() {

		SQLConnection data = new SQLConnection();
		data.ConnectDriver();

		assertNotNull(data.getConn());

	}

}
