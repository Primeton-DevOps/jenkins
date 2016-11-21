/*******************************************************************************
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 21, 2016 11:39:43 AM
 *******************************************************************************/

package com.primeton.devops.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.primeton.devops.velocity.ParseTool;
import com.primeton.devops.velocity.VelocityUtil;

/**
 * JobTemplateTestCase.
 *
 * @author zhongwen (mailto:zhongwen@primeton.com)
 */
public class PipelineJobTemplateTestCase extends AbstractTestCase {

	/* (non-Javadoc)
	 * @see com.primeton.devops.test.AbstractTestCase#test()
	 */
	@Override
	public void test() throws Exception {
		Map<String, Object> context = new HashMap<>();
		
		Map<String, Object> generalSettings = getGeneralSettings();
		List<Map<String, Object>> buildTriggerSettings = getBuildTriggerSettings();
		List<Map<String, Object>> parameterSettings = getParameterSettings();
		Map<String, Object> piplelineSettings = getPipelineSettings();
		
		generalSettings.put("parameters", parameterSettings);
		generalSettings.put("triggers", buildTriggerSettings);
		
		context.put("job", generalSettings);
		context.put("pipeline", piplelineSettings);
		context.put("parseTool", ParseTool.getSingleton());
		
		String content = VelocityUtil.merge("/templates/job/pipeline/job.vm", "UTF-8", context, VelocityUtil.getClassResourceLoaderSettings());
		System.out.println(content);
	}
	
	/**
	 * 
	 * @return
	 */
	private Map<String, Object> getGeneralSettings() {
		Map<String, Object> settings = new HashMap<>();
		settings.put("description", "This is a test job");
		settings.put("keepDependencies", "false");
		settings.put("parametersDefinition", "true");
		settings.put("buildTriggers", "true");

		settings.put("discardOldBuilds", "true");
		settings.put("daysToKeep", 10);
		settings.put("numToKeep", 5);
		return settings;
	}
	
	/**
	 * 
	 * @return
	 */
	private List<Map<String, Object>> getBuildTriggerSettings() {
		List<Map<String, Object>> triggers = new ArrayList<>();
		
		Map<String, Object> timeTrigger = new HashMap<>();
		timeTrigger.put("type", "Time");
		timeTrigger.put("spec", "H/59 * * * *");
		
		Map<String, Object> githubPushTrigger = new HashMap<>();
		githubPushTrigger.put("type", "GithubPush");
		githubPushTrigger.put("spec", "");
		
		triggers.add(timeTrigger);
//		triggers.add(githubPushTrigger);
		return triggers;
	}
	
	/**
	 * 
	 * @return
	 */
	private List<Map<String, Object>> getParameterSettings() {
		List<Map<String, Object>> parameters = new ArrayList<>();
		
		Map<String, Object> param1 = new HashMap<>();
		param1.put("type", "Boolean");
		param1.put("name", "param1");
		param1.put("defaultValue", "true");
		param1.put("description", "This is a test parameter.");
		parameters.add(param1);
		
		Map<String, Object> param2 = new HashMap<>();
		param2.put("type", "String");
		param2.put("name", "param2");
		param2.put("defaultValue", "Jenkins Pipleline Job");
		param2.put("description", "This is a test parameter.");
		parameters.add(param2);
		
		return parameters;
	}
	
	/**
	 * 
	 * @return
	 */
	private Map<String, Object> getPipelineSettings() {
		Map<String, Object> settings = new HashMap<>();
		settings.put("sandbox", "true");

		//settings.put("codeType", "general"); // general(default) / node / stage
		//settings.put("script", "node {\n	stage('HelloWorld') {\n		echo 'Hello World'\n	}\n}");
		
		settings.put("codeType", "stage");
//		settings.put("nodeSelector", "java");
		
		List<Map<String, Object>> stages = new ArrayList<>();
		settings.put("stages", stages);
		
		Map<String, Object> stage1 = new HashMap<>();
		stage1.put("name", "Build Maven Source");
		List<Map<String, Object>> steps = new ArrayList<>();
		stage1.put("steps", steps);
		stages.add(stage1);
		
		Map<String, Object> step1 = new HashMap<>();
		steps.add(step1);
		step1.put("codeType", "plugin");
//		step1.put("codeType", "general"); // default
		step1.put("pluginName", "git");
//		step1.put("branch", "master");
		step1.put("branch", "1.0");
		step1.put("changelog", "false");
//		step1.put("poll", "false");
		step1.put("url", "https://github.com/Primeton-DevOps/test.git");
		
		Map<String, Object> step2 = new HashMap<>();
		steps.add(step2);
		step2.put("codeType", "plugin");
		step2.put("pluginName", "sh");
		step2.put("returnStdout", "true");
		step2.put("returnStatus", "false");
		step2.put("encoding", "UTF-8");
		step2.put("script", "mvn clean package -s ~/.m2/settings.xml");
		
		Map<String, Object> step3 = new HashMap<>();
		steps.add(step3);
		step3.put("codeType", "general"); // or not put
		//step3.put("script", "sh '''binary=`find . -name test.war`\nif [ -f ${binary} ]; then\n\techo 'Build success.'\nelse\necho 'Build failed.'\nfi'''");
		step3.put("script", "echo 'Build success'");
		
		// other steps
		
		return settings;
	}

}
