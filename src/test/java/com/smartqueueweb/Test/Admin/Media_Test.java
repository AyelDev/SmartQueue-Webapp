package com.smartqueueweb.Test.Admin;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;

import com.smartqueueweb.Model.MediaBean;
import com.smartqueueweb.Service.ServiceImpl;

public class Media_Test {

	@Test
	public void GetAllVideos_ShouldNotReturnNull() {
		
		ServiceImpl service = new ServiceImpl();
		
		List<MediaBean> actual = service.videoList();
		
		assertNotNull(actual);
		
		System.out.println(actual);
		
	}

}
