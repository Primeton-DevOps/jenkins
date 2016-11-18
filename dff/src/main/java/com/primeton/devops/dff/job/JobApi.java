/*******************************************************************************
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 17, 2016 10:15:44 AM
 *******************************************************************************/

package com.primeton.devops.dff.job;

/**
 * JobApi.
 *
 * @author ZhongWen Li (mailto:lizw@primeton.com)
 */
public interface JobApi {
	
	/**
	 * 
	 * @param jobName
	 * @param jobConfig
	 * @return
	 * @throws JobException
	 */
	void createJob(String jobName, String jobConfig) throws JobException;
	
	/**
	 * 
	 * @param jobName
	 * @throws JobException
	 */
	void deleteJob(String jobName) throws JobException;
	
	/**
	 * 
	 * @param jobName
	 * @throws JobException
	 */
	void runJob(String jobName) throws JobException;
	
}
