/*******************************************************************************
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 23, 2016 10:12:56 AM
 *******************************************************************************/

package com.primeton.devops.httl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import httl.Engine;
import httl.Template;

/**
 * HelloHttl.
 *
 * @author ZhongWen Li (mailto:lizw@primeton.com)
 */
public class HelloHttl {
	
	/**
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		List<Book> books = new ArrayList<>();
		for (int i = 0; i < 10; i++) {
			books.add(new Book(String.valueOf(10000 + i), UUID.randomUUID().toString().toUpperCase()));
		}
		Map<String, Object>parameters = new HashMap<>();
		parameters.put ("title", "Book");
		parameters.put ("books", books);
		
		Engine engine = Engine.getEngine(getSettings());
		Template template = engine.getTemplate ("/templates/book.httl.html");
		template.render(parameters, System.out);
	}
	
	private static Properties getSettings() {
		Properties properties = new Properties();
		// # book.properties
		// import.packages = com.primeton.devops
		// template.directory =
		// message.basename = messages
		// input.encoding = UTF-8
		// output.encoding = UTF-8
		// reloadable = false
		// precompiled = false
		properties.setProperty("import.packages", "com.primeton.devops.httl");
		properties.setProperty("input.encoding", "UTF-8");
		properties.setProperty("output.encoding", "UTF-8");
		properties.setProperty("reloadable", "false");
		properties.setProperty("precompiled", "false");
		return properties;
	}

}
