/*******************************************************************************
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 23, 2016 9:41:44 AM
 *******************************************************************************/

package com.primeton.devops.freemarker;

/**
 * SystemUtil.
 *
 * @author ZhongWen Li (mailto:lizw@primeton.com)
 */
public class SystemUtil {

	/**
	 * Default. <br>
	 */
	private SystemUtil() {
		super();
	}
	
	/**
	 * 
	 * @return
	 */
	public static boolean isUnix() {
		return !isWindows();
	}
	
	/**
	 * 
	 * @return
	 */
	public static boolean isWindows() {
		return System.getProperty("os.name").toLowerCase().contains("windows"); //$NON-NLS-1$ //$NON-NLS-2$
	}
	
}
