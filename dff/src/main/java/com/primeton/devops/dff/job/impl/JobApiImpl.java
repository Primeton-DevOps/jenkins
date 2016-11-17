/*******************************************************************************
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 17, 2016 10:18:46 AM
 *******************************************************************************/

package com.primeton.devops.dff.job.impl;

import org.apache.commons.lang.StringUtils;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;

import com.primeton.devops.dff.job.Job;
import com.primeton.devops.dff.job.JobApi;
import com.primeton.devops.dff.job.JobException;
import com.primeton.devops.dff.utils.HttpClientUtil;
import com.primeton.devops.dff.utils.HttpClientUtil.HttpResult;

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
		String url = HttpClientUtil.getFullURL("createItem?name=" + jobName); //$NON-NLS-1$
		StringEntity entity = new StringEntity(jobConfig, ContentType.APPLICATION_XML);
		
		try {
			HttpResult result = HttpClientUtil.sendRequest("POST", url, null, entity);
			System.out.println(result);
		} catch (Exception e) {
			throw new JobException(String.format("Create job '%s' error.", jobName), e);
		}
		return null;
	}

}
