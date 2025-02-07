package com.smartqueueweb.Test.Admin;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.anyDouble;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class UpdateAdmin {
	
	ServiceImpl service = null;
	
	@Test
	public void UpdateAdminPassword_ShouldReturnTrue() {
		service = new ServiceImpl();
		
		try {
			boolean expected = true;
			boolean actual = service.updateAdmin(2, "admintest4", "admintest4");
			assertEquals(expected, actual);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
	}

}
