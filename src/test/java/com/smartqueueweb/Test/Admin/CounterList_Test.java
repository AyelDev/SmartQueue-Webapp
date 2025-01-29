package com.smartqueueweb.Test.Admin;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;

import com.smartqueueweb.Model.CountersBean;
import com.smartqueueweb.Service.ServiceImpl;

public class CounterList_Test {
	
	ServiceImpl service = new ServiceImpl();

	@Test
	public void AddCounters_shouldReturnOne() {
		int expected = 1;
		int actual = service.addCounters(4 ,"4testDescription");
		assertEquals(expected, actual);
	}
	
	@Test
	public void CountersList_shouldReturnLists() {
		List<CountersBean> actual = service.counterList();
		assertNotNull(actual);
	}

	@Test
	public void UpdateCounters_shouldReturnTrue() {
		boolean expected = true;
		boolean actual = service.updateCounters(22, 8, "4updatedDescription", "active");
		
		assertEquals(expected, actual);
	}
	
	@Test
	public void DeteCounters_shouldReturnTrue() {
		boolean expected = true;
		boolean actual = service.deleteCounters(19);
		
		assertEquals(expected, actual);
	}



}
