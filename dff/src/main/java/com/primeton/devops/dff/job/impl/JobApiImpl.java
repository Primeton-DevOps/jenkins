/*******************************************************************************
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 17, 2016 10:18:46 AM
 *******************************************************************************/

package com.primeton.devops.dff.job.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpStatus;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;

import com.primeton.devops.dff.Constants;
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
		String url = HttpClientUtil.getFullURL("/createItem?name=" + jobName); //$NON-NLS-1$
		StringEntity entity = new StringEntity(jobConfig, ContentType.APPLICATION_XML);
		
		Map<String, String> header = new HashMap<>();
		header.put("Accept", "application/json");
		// See jenkins source code 
		// hudson.security.csrf.CrumbFilter
		// hudson.security.csrf.DefaultCrumbIssuer
		header.put("Jenkins-Crumb", Constants.JENKINS_CRUMB);
		
		try {
			HttpResult result = HttpClientUtil.sendRequest("POST", url, header, entity);
			System.out.println(result);
			if (HttpStatus.SC_OK == result.getStatus()) {
				System.out.println(String.format("Create job '%s' success.", jobName));
			} else {
				System.out.println(String.format("Create job '%s' failed.", jobName));
			}
		} catch (Exception e) {
			throw new JobException(String.format("Create job '%s' error.", jobName), e);
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.primeton.devops.dff.job.JobApi#deleteJob(java.lang.String)
	 */
	@Override
	public void deleteJob(String jobName) throws JobException {
		if (StringUtils.isEmpty(jobName)) {
			return;
		}
		// POST /job/${jobName}/doDelete
		String url = HttpClientUtil.getFullURL(String.format("/job/%s/doDelete", jobName)); //$NON-NLS-1$
		Map<String, String> header = new HashMap<>();
		header.put("Accept", "application/json"); //$NON-NLS-1$ //$NON-NLS-2$
		// See jenkins source code 
		// hudson.security.csrf.CrumbFilter
		// hudson.security.csrf.DefaultCrumbIssuer
		header.put("Jenkins-Crumb", Constants.JENKINS_CRUMB); //$NON-NLS-1$
		
		try {
			HttpResult result = HttpClientUtil.sendRequest("POST", url, header); //$NON-NLS-1$
			System.out.println(result);
			System.out.println(String.format("Delete job '%s' success.", jobName));
		} catch (Exception e) {
			throw new JobException(String.format("Delete job '%s' error.", jobName), e);
		}
	}

	/* (non-Javadoc)
	 * @see com.primeton.devops.dff.job.JobApi#runJob(java.lang.String)
	 */
	@Override
	public void runJob(String jobName) throws JobException {
		if (StringUtils.isEmpty(jobName)) {
			return;
		}
		// POST /job/${jobName}/buildWithParameters
		String url = HttpClientUtil.getFullURL(String.format("/job/%s/buildWithParameters", jobName)); //$NON-NLS-1$
		Map<String, String> header = new HashMap<>();
		header.put("Accept", "application/json"); //$NON-NLS-1$ //$NON-NLS-2$
		// See jenkins source code 
		// hudson.security.csrf.CrumbFilter
		// hudson.security.csrf.DefaultCrumbIssuer
		header.put("Jenkins-Crumb", Constants.JENKINS_CRUMB); //$NON-NLS-1$
		
		try {
			HttpResult result = HttpClientUtil.sendRequest("POST", url, header); //$NON-NLS-1$
			System.out.println(result);
			System.out.println(String.format("Trigger job '%s' success.", jobName));
		} catch (Exception e) {
			throw new JobException(String.format("Trigger job '%s' error.", jobName), e);
		}
		
	}

}
