package com.smartqueueweb.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;

import com.smartqueueweb.Model.AdminBean;
import com.smartqueueweb.Service.ServiceImpl;

public class addStudent_Test {

	private AdminBean adminBean;
	private ServiceImpl mockServiceImpl;
	
	@Before
	public void setup() {
	
	mockServiceImpl = mock(ServiceImpl.class);
	adminBean = new AdminBean();
//	adminBean.setAdminId(1);
//	adminBean.setUsername("cecadmin");
//	adminBean.setPassword("admin123");
	}
	
	@Test
	public void ItShouldAddTheStudent() {
		
		when(mockServiceImpl.addStudent(1231231, "ariel", "piodena", "abelgas", "BSIT")).thenReturn(1);
		
		int expected = 1;
		int actual = mockServiceImpl.addStudent(1231231, "ariel", "piodena", "abelgas", "BSIT");
		
		assertEquals(expected, actual);
	}

}
