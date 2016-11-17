/*******************************************************************************
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 17, 2016 10:18:46 AM
 *******************************************************************************/

package com.primeton.devops.dff.job.impl;

import org.apache.commons.lang.StringUtils;

import com.primeton.devops.dff.job.Job;
import com.primeton.devops.dff.job.JobApi;
import com.primeton.devops.dff.job.JobException;

/**
 * JobApiImpl.
 *
 * @author ZhongWen Li (mailto:lizw@primeton.com)
 */
public class JobApiImpl implements JobApi {

	/* (non-Javadoc)
	 * @see com.primeton.devops.dff.job.JobApi#createJob(java.lang.String, java.lang.String)
	 */
	@Override
	public Job createJob(String jobName, String jobConfig) throws JobException {
		if (StringUtils.isEmpty(jobName) || StringUtils.isEmpty(jobConfig)) {
			return null;
		}
		
		return null;
	}

}
