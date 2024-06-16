package sqTestCases;

import static org.junit.Assert.*;

import org.junit.Test;

import sqModel.smartqueue_DataAccessLayer;

public class Login_Test {

	@Test
	public void test() {
		String User = "user";
		String Pass = "pass";
		
		smartqueue_DataAccessLayer database = new smartqueue_DataAccessLayer();
		database.Login(User, Pass);
		assertTrue(database.Login(User, Pass));
		
		
	}

}
