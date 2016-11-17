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
import java.util.concurrent.TimeUnit;

import com.primeton.devops.dff.job.JobApi;
import com.primeton.devops.dff.job.JobException;
import com.primeton.devops.dff.utils.ServiceLoaderUtil;
import com.primeton.devops.dff.utils.VelocityUtil;

/**
 * JobCreateTestCase.
 *
 * @author ZhongWen Li (mailto:lizw@primeton.com)
 */
public class JobCreateTestCase extends AbstractTestCase {
	
	private static final String AUTH_TOKEN = "W5TLNgNN6E_FZVaNkyNiBW_0JM2VrOFM3KpZqPR3EEc";

	private final String uid = new SimpleDateFormat("yyyyMMddHHmmSS").format(new Date()); //$NON-NLS-1$
	
	private String jobName = "job-" + uid; //$NON-NLS-1$
	private String jobName2 = "clean-job-" + uid; //$NON-NLS-1$
	
	private String resourceName = "ResourceQuota-" + uid;

	/* (non-Javadoc)
	 * @see com.primeton.devops.test.AbstractTestCase#test()
	 */
	@Override
	public void test() throws Exception {
		
		String jobConfig = getJobConfig(getResourceQuota(resourceName));
		System.out.println();
		System.out.println(jobConfig);
		System.out.println();
		
		JobApi api = ServiceLoaderUtil.load(JobApi.class);
		api.createJob(jobName, jobConfig);
		
		api.runJob(jobName);
		
		TimeUnit.SECONDS.sleep(100);
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
		openshiftSettings.put("authToken", AUTH_TOKEN);
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
	private String getResourceQuota(String resourceName) throws FileNotFoundException {
		String template = getTemplateAsString("classpath:/templates/openshift/ResourceQuota.velocity.yaml");
		System.err.println(template);
		
		Map<String, Object> context = new HashMap<>();
		context.put("name", resourceName);
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
		
		return yaml.replaceAll("'", "\\\\&apos;");
	}
	
	/**
	 * 
	 * @throws FileNotFoundException
	 * @throws JobException
	 */
	private void createDeleteResourceQuotaJob() throws FileNotFoundException, JobException {
		String template = getTemplateAsString("classpath:/templates/job/DeleteResourcePipelineJobTemplate.velocity.xml");
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
		openshiftSettings.put("authToken", AUTH_TOKEN);
		openshiftSettings.put("resourceName", resourceName);
		openshiftSettings.put("resourceType", "ResourceQuota");
		openshiftSettings.put("namespace", "default");
		openshiftSettings.put("verbose", "false");
		
		piplelineSettings.put("sandbox", "true");
		
		String jobConfig = VelocityUtil.parse(template, context, "PipelineJob"); //$NON-NLS-1$
		
		System.out.println();
		System.out.println(jobConfig);
		System.out.println();
		
		// create job
		JobApi api = ServiceLoaderUtil.load(JobApi.class);
		api.createJob(jobName2, jobConfig);
	}
	
	/* (non-Javadoc)
	 * @see com.primeton.devops.test.AbstractTestCase#clean()
	 */
	@Override
	public void clean() {
		// Auto-generated method stub
		super.clean();
		// Delete ResourceQuota
		try {
			createDeleteResourceQuotaJob();
			runDeleteResourceQuotaJobWithClean();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 */
	private void runDeleteResourceQuotaJobWithClean() throws Exception {
		JobApi api = ServiceLoaderUtil.load(JobApi.class);
		api.runJob(jobName2);
		TimeUnit.SECONDS.sleep(30);
		api.deleteJob(jobName2);
		api.deleteJob(jobName);
	}

}
