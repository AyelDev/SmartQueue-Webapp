package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class VideoUpload_Test {

	ServiceImpl service = new ServiceImpl();
	
	@Test
	public void test() {
		int expected = 1;
		int actual = service.addVideo("sample.mp4", "C:/sample/sample/sample", "video/mp4");
		assertEquals(expected, actual);
	}

}
