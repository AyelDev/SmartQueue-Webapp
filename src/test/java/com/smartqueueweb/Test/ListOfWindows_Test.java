package com.smartqueueweb.Test;

import static org.junit.Assert.assertNotEquals;

import java.util.List;

import org.junit.Test;

import com.smartqueueweb.Model.ServicesBean;
import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Service.ServiceImpl;

public class ListOfWindows_Test {

	@Test
	public void test() {
		ServiceImpl services = new ServiceImpl();
		
		List<StaffBean> expected = null;
		List<ServicesBean> actual = services.windowList();
		assertNotEquals(expected, actual);
		
	}

}
