package com.ewolff.aspects;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class ExceptionHandler {

	@AfterThrowing(throwing="e", value="execution(* com.ewolff.highscore..*.*(..))")
	public void logExceptiomn(Throwable e, JoinPoint joinpoint) {
		System.out.println("Exception in "+joinpoint);
		e.printStackTrace();
	}
	
}
