package com.smartqueueweb.Test.Staff;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Service.ServiceImpl;

public class ResetPassword {

	ServiceImpl service = new ServiceImpl();
	
	@Test
	public void TestStep1_ShouldReturnOne() {
		 boolean actual = service.resetPasswordStep1("aabelgas@gmail.com");
		 boolean expectation = true;
		 assertEquals(expectation, actual);
	}
	
	@Test
	public void TestStep2_ShouldReturnOne() {
		
		//if not set contact admin
		 StaffBean actual = service.resetPasswordStep2("1889", "aabelgas@gmail.com");
		 StaffBean expectation = null;
		 assertNotEquals(expectation, actual);
	}

}
