/*******************************************************************************
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 17, 2016 11:38:10 AM
 *******************************************************************************/

package com.primeton.devops.dff.utils;

import java.util.Iterator;
import java.util.Map;
import java.util.ServiceLoader;
import java.util.concurrent.ConcurrentHashMap;

/**
 * ServiceLoaderUtil.
 *
 * @author ZhongWen Li (mailto:lizw@primeton.com)
 */
public class ServiceLoaderUtil {
	
	private ServiceLoaderUtil() {
	}
	
	private static Map<Object, Object> buffer = new ConcurrentHashMap<>();
	
	@SuppressWarnings("unchecked")
	public static <T> T load(Class<T> clazz) {
		if (null == clazz) {
			return null;
		}
		if (buffer.containsKey(clazz)) {
			return (T)buffer.get(clazz);
		}
		if (buffer.containsKey(clazz.getName())) {
			return (T)buffer.get(clazz.getName());
		}
		Iterator<T> iterator = ServiceLoader.load(clazz).iterator();
		if (iterator.hasNext()) {
			T obj = iterator.next();
			buffer.put(clazz, obj);
			return obj;
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public static <T> T load(String clazz) {
		if (null == clazz) {
			return null;
		}
		if (buffer.containsKey(clazz)) {
			return (T)buffer.get(clazz);
		}
		try {
			 Object obj = load(Class.forName(clazz));
			 if (null != obj) {
				 buffer.put(clazz, obj);
				 return (T)obj;
			 }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

}
