package com.ewolff.aspects;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class TracingAspect {

	@Before("execution(* com.ewolff.highscore..*.*(..))")
	public void traceEnter(JoinPoint joinPoint) {
		System.out.println("enter "+joinPoint);
	}
	

	@After("execution(* com.ewolff.highscore..*.*(..))")
	public void traceExit(JoinPoint joinPoint) {
		System.out.println("exit "+joinPoint);
	}

}
