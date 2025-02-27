package com.smartqueueweb.Test.Admin;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class DeleteVideo {

	ServiceImpl service = null;

	@Test
	public void test() {

		try {
			
			service = new ServiceImpl();
			
			boolean expected = true;
			boolean actual = service.deleteVideo(142);

			assertEquals(expected, actual);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
