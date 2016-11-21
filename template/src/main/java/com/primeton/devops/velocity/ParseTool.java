/*******************************************************************************
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 21, 2016 11:11:10 AM
 *******************************************************************************/

package com.primeton.devops.velocity;

import java.util.Map;

/**
 * ParseUtil.
 *
 * @author zhongwen (mailto:zhongwen@primeton.com)
 */
public class ParseTool {
	
	private static final ParseTool SINGLETON_INSTANCE = new ParseTool();
	
	private static final String PATH_PREFIX = "classpath:"; //$NON-NLS-1$
	
	public static final String DEFAULT_ENCODING = "UTF-8"; //$NON-NLS-1$
	
	/**
	 * Default. <br>
	 */
	private ParseTool() {
	}
	
	/**
	 * 
	 * @return
	 */
	public static ParseTool getSingleton() {
		return SINGLETON_INSTANCE;
	}
	
	/**
	 * 
	 * @param template
	 * @param context
	 * @return
	 */
	public static String parse(String template, Map<String, Object> context) {
		return VelocityUtil.parse(template, context, null); 
	}
	
	/**
	 * 
	 * @param templateName
	 * @param context
	 * @return
	 */
	public static String merge(String templateName, Map<String, Object> context) {
		if (null == templateName) {
			return templateName;
		}
		if (templateName.startsWith(PATH_PREFIX)) {
			templateName = templateName.toLowerCase().substring(PATH_PREFIX.length());
			return VelocityUtil.merge(templateName, DEFAULT_ENCODING, context, VelocityUtil.getClassResourceLoaderSettings());
		}
		return VelocityUtil.merge(templateName, DEFAULT_ENCODING, context, VelocityUtil.getFileResourceLoaderSettings());
	}

}
