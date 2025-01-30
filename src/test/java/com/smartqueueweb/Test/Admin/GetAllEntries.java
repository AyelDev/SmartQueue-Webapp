package com.smartqueueweb.Test.Admin;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;

import com.smartqueueweb.Model.QueueEntryBean;
import com.smartqueueweb.Service.ServiceImpl;
public class GetAllEntries {

	ServiceImpl service = new ServiceImpl();
	
	@Test
	public void GetAllEntries_shouldNotReturnNull() {
		
		List<QueueEntryBean> list = service.listOfEnquiries();
		assertNotNull(list);
	}

}
