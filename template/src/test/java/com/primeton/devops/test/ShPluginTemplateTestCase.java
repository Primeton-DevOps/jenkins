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
public class ShPluginTemplateTestCase extends AbstractTestCase {

	/* (non-Javadoc)
	 * @see com.primeton.devops.test.AbstractTestCase#test()
	 */
	@Override
	public void test() throws Exception {
		// Auto-generated method stub
		Map<String, Object> context = new HashMap<>();
		Map<String, Object> shSettings = new HashMap<>();
		context.put("sh", shSettings); //$NON-NLS-1$
		
		// returnStdout returnStatus only one can be enabled
//		shSettings.put("returnStdout", "false");
		shSettings.put("returnStdout", "true");
//		shSettings.put("returnStatus", "false");
//		shSettings.put("returnStatus", "true");
//		shSettings.put("encoding", "UTF-8");
		shSettings.put("encoding", "GBK");
		shSettings.put("script", "ls -al \nps -ef | grep java \nsystemctl start nginx.service \nv1=\"Hello World\" \necho ${v1} \nv2='Velocity' \necho ${v2}"); //$NON-NLS-1$
		
		String content = VelocityUtil.merge("/templates/job/plugin/sh.vm", "utf-8", context, VelocityUtil.getClassResourceLoaderSettings());
		System.out.println(content);
	}

}
