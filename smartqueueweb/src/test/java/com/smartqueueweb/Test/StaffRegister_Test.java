package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.DAO.StaffDAO;

public class StaffRegister_Test {

	@Test
	public void test() {

		StaffDAO obj = new StaffDAO();
		int expected = 1;
		int actual = obj.registerStaff("pee", "poo", "poo@gmail.com", 230291, "rrreee", "roo");

		assertEquals(expected, actual);
	}
}
