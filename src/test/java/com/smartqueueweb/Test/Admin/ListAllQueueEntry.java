package com.smartqueueweb.Test.Admin;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;

import com.smartqueueweb.Model.MonthQueueSummaryBean;
import com.smartqueueweb.Service.ServiceImpl;

public class ListAllQueueEntry {

	ServiceImpl service = new ServiceImpl();
	
	@Test
	public void ListAllMonthlyQueueEntries_ShouldNotReturnNull() {
		List<MonthQueueSummaryBean> monthQueueSummary = service.listOfMonthlyQueues();
		assertNotNull(monthQueueSummary);
	}

}
