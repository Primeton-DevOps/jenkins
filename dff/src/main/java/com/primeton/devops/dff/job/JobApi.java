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
	
	Job createJob(String jobName, String jobConfig) throws JobException;

}
