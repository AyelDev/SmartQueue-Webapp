package com.smartqueueweb.Test;

import static org.junit.Assert.assertNotEquals;

import java.util.List;

import org.junit.Test;

import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Service.ServiceImpl;

public class ListOfStaffPasswordRequest_Test {

	@Test
	public void testIfItsFetchesAllTheRequestedList() {
		ServiceImpl service = new ServiceImpl();
		
		List<StaffBean> expected = null;
		List<StaffBean>  actual = service.listOfStaffPasswordRequests(0);
		assertNotEquals(expected, actual);
		
	}

}
