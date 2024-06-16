package sqTestCases;

import static org.junit.Assert.*;

import org.junit.Test;

import sqModel.smartqueue_DataAccessLayer;

public class SQLConnection_Test {

	@Test
	public void test() {
	smartqueue_DataAccessLayer data = new smartqueue_DataAccessLayer();
		
		assertNotNull(data.conn);
	
	}

}
