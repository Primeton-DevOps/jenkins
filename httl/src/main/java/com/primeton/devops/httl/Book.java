/*******************************************************************************
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 23, 2016 10:34:55 AM
 *******************************************************************************/

package com.primeton.devops.httl;

/**
 * Book.
 *
 * @author ZhongWen Li (mailto:lizw@primeton.com)
 */
public class Book {
	
	private String snid;
	private String name;
	/**
	 * 
	 */
	public Book() {
		super();
		// Auto-generated constructor stub
	}
	/**
	 * @param snid
	 * @param name
	 */
	public Book(String snid, String name) {
		super();
		this.snid = snid;
		this.name = name;
	}
	/**
	 * @return Returns the snid.
	 */
	public String getSnid() {
		return snid;
	}
	/**
	 * @param snid The snid to set.
	 */
	public void setSnid(String snid) {
		this.snid = snid;
	}
	/**
	 * @return Returns the name.
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name The name to set.
	 */
	public void setName(String name) {
		this.name = name;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Book [snid=" + snid + ", name=" + name + "]";
	}

}
