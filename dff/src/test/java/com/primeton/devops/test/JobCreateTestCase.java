/*******************************************************************************
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 17, 2016 11:20:37 AM
 *******************************************************************************/

package com.primeton.devops.test;

import java.io.FileNotFoundException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.primeton.devops.dff.job.JobApi;
import com.primeton.devops.dff.utils.ServiceLoaderUtil;
import com.primeton.devops.dff.utils.VelocityUtil;

/**
 * JobCreateTestCase.
 *
 * @author ZhongWen Li (mailto:lizw@primeton.com)
 */
public class JobCreateTestCase extends AbstractTestCase {
	
	private String jobName = "job-" + new SimpleDateFormat("yyyyMMddHHmmSS").format(new Date()); //$NON-NLS-1$ //$NON-NLS-2$

	/* (non-Javadoc)
	 * @see com.primeton.devops.test.AbstractTestCase#test()
	 */
	@Override
	public void test() throws Exception {
		
		String jobConfig = getJobConfig(getResourceQuota());
		System.out.println();
		System.out.println(jobConfig);
		System.out.println();
		
		JobApi api = ServiceLoaderUtil.load(JobApi.class);
		api.createJob(jobName, jobConfig);
	}
	
	/**
	 * 
	 * @param resourceQuotaDescriptor
	 * @return
	 * @throws FileNotFoundException
	 */
	private String getJobConfig(String resourceQuotaDescriptor) throws FileNotFoundException {
		System.out.println();
		System.out.println(resourceQuotaDescriptor);
		System.out.println();
		
		String template = getTemplateAsString("classpath:/templates/job/CreateResourcePipelineJobTemplate.velocity.xml");
		System.err.println(template);
		
		Map<String, Object> context = new HashMap<>();
		Map<String, Object> jobSettings = new HashMap<>();
		Map<String, Object> openshiftSettings = new HashMap<>();
		Map<String, Object> piplelineSettings = new HashMap<>();
		
		context.put("job", jobSettings);
		context.put("openshift", openshiftSettings);
		context.put("pipleline", piplelineSettings);
		
		jobSettings.put("daysToKeep", 3);
		jobSettings.put("numToKeep", "10");
		
		openshiftSettings.put("url", "https://192.168.2.91:8443");
		openshiftSettings.put("authToken", "dM5ip5fpvpNBJzDvk-qWn68NZz8bRro-LfX5rh5PdGI");
		openshiftSettings.put("resourceDescriptor", resourceQuotaDescriptor);
		openshiftSettings.put("namespace", "default");
		openshiftSettings.put("verbose", "false");
		
		piplelineSettings.put("sandbox", "true");
		
		String jobConfig = VelocityUtil.parse(template, context, "PipelineJob"); //$NON-NLS-1$
		
		System.out.println();
		System.out.println(jobConfig);
		System.out.println();
		
		return jobConfig;
	}
	
	/**
	 * 
	 * @return
	 * @throws FileNotFoundException
	 */
	private String getResourceQuota() throws FileNotFoundException {
		String template = getTemplateAsString("classpath:/templates/openshift/ResourceQuota.velocity.yaml");
		System.err.println(template);
		
		Map<String, Object> context = new HashMap<>();
		context.put("memory", 100);
		context.put("cpu", "200");
		context.put("pods", "100");
		context.put("services", "100");
		context.put("replicationcontrollers", "50");
		context.put("resourcequotas", "10");
		
		String yaml = VelocityUtil.parse(template, context, "ResourceQuota.yaml");
		System.out.println();
		System.out.println(yaml);
		System.out.println();
		
		return yaml.replaceAll("'", "&apos;");
	}

}
