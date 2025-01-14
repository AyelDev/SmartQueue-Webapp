package com.smartqueueweb.Test;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.smartqueueweb.Service.ServiceImpl;

public class temporaryRegisterStudent_Test {

	@Mock
	private ServiceImpl serviceImpl;
	
	@Before
	public void setup() {
	MockitoAnnotations.openMocks(this);
	}
	
	@Test
	public void TempRegisterStudent_ShouldReturnOne_One() {
	
		when(serviceImpl.tempRegisterStudent("000", "ariel", "piodena", "abelgas", "BSIT")).thenReturn(1);
		
		int expected = 1;
		int actual = serviceImpl.tempRegisterStudent("000", "ariel", "piodena", "abelgas", "BSIT");
		
		assertEquals(expected, actual);
		
	}

}
