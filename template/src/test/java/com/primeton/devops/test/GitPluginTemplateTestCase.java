/**
 * 
 */
package com.primeton.devops.test;

import java.util.HashMap;
import java.util.Map;

import com.primeton.devops.velocity.VelocityUtil;

/**
 * @author ZhongWen (mailto:lizhongwen1989@gmail.com)
 *
 */
public class GitPluginTemplateTestCase extends AbstractTestCase {

	/* (non-Javadoc)
	 * @see com.primeton.devops.test.AbstractTestCase#test()
	 */
	@Override
	public void test() throws Exception {
		Map<String, Object> context = new HashMap<>();
		Map<String, Object> gitSettings = new HashMap<>();
		context.put("git", gitSettings);
		
//		gitSettings.put("branch", "master");
		gitSettings.put("branch", "1.0.0");
//		gitSettings.put("changelog", "true");
		gitSettings.put("changelog", "false");
		gitSettings.put("credentialsId", "${uuid}");
//		gitSettings.put("poll", "true");
		gitSettings.put("poll", "false");
		gitSettings.put("url", "https://github.com/Primeton-DevOps/jenkins.git");
		
		String content = VelocityUtil.merge("/templates/job/plugin/git.vm", "utf-8", context, VelocityUtil.getClassResourceLoaderSettings());
		System.out.println(content);
	}

}
