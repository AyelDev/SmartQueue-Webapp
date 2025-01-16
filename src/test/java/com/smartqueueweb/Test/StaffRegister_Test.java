package com.smartqueueweb.Test;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;

import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Service.ServiceImpl;

public class StaffRegister_Test {

	private StaffBean staffBean;
	private ServiceImpl mockServiceImpl;
	
	@Before
	public void setup() {
		mockServiceImpl = mock(ServiceImpl.class);
		staffBean = new StaffBean();
	}
	
	@Test
	public void test() {

		when(mockServiceImpl.registerStaff("john", "cena", "johncena@gmail.com", "09666170733", "johnCena")).thenReturn(1);
		
		int expected = 1;
		int actual = mockServiceImpl.registerStaff("john", "cena", "johncena@gmail.com", "09666170733", "johnCena");
		
		assertEquals(expected, actual);
		//		String mypass = "password";
//		StaffDAO obj = new StaffDAO();
//		String hashed = BCrypt.hashpw(mypass, BCrypt.gensalt(10));
		
//		int expected = 1;
//		double ss = 09672919283d;
//		int actual = obj.registerStaff("lol", "loloÑÑññs", "lolos@gmail.com", ss, "lolos");

		
	}
}
