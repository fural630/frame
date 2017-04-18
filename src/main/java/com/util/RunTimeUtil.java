package com.util;

import org.apache.log4j.Logger;

public class RunTimeUtil {
	
	private static Logger logger = Logger.getLogger(RunTimeUtil.class);  
	
	private static Long beginTime;
	private static Long endTime;
	
	public static void recordBegin() {
		beginTime = System.currentTimeMillis();
	}
	
	public static void recordEnd() {
		endTime = System.currentTimeMillis();
		Long usedTime = endTime - beginTime;
		logger.debug("Used time : " + usedTime + " ms");
	}
}
