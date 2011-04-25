package com.ewolff.highscore.exception;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/META-INF/spring/applicationContext.xml")
@Transactional
public class ExceptionTest {

	@Test(expected=IllegalArgumentException.class)
	public void testException() {
		throw new IllegalArgumentException();
	}
	
}
