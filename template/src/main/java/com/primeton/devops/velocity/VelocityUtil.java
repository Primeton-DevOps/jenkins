package com.primeton.devops.velocity;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;

/**
 * 
 * VelocityUtil.
 *
 * @author zhongwen (mailto:zhongwen@primeton.com)
 */
public class VelocityUtil {
	
	private static Logger logger = Logger.getLogger(VelocityUtil.class);
	
	/**
	 * 
	 * @param template
	 * @param context
	 * @param logTag
	 * @return
	 */
	public static String parse(InputStream template, Map<String, Object> context, String logTag) {
		return parse(template, context, logTag, null);
	}
	
	/**
	 * 
	 * @param template
	 * @param context
	 * @param logTag
	 * @param settings
	 * @return
	 */
	public static String parse(InputStream template, Map<String, Object> context, String logTag, Properties settings) {
		if (null == template) {
			return null;
		}
		logTag = null == logTag ? "" : logTag;
		if (null == settings || settings.isEmpty()) {
			Velocity.init();
		} else {
			Velocity.init(settings);
		}
		VelocityContext vcontext = new VelocityContext();
		if (null != context && !context.isEmpty()) {
			for (String key : context.keySet()) {
				vcontext.put(key, context.get(key));
			}
		}
		StringWriter writer = null;
		InputStreamReader reader = null;
		try {
			writer = new StringWriter();
			reader = new InputStreamReader(template);
			Velocity.evaluate(vcontext, writer, logTag, reader);
			writer.flush();
			String content = writer.toString();
			return content;
		} catch (Throwable t) {
			logger.error("An error occured while try to parse template.", t);
		} finally {
			IOUtils.closeQuietly(writer, reader);
		}
		return null;
	}
	
	/**
	 * 
	 * @param template
	 * @param context
	 * @param logTag
	 * @return
	 */
	public static String parse(String template, Map<String, Object> context, String logTag) {
		return parse(template, context, logTag, null);
	}
	
	/**
	 * if parse error return template(source). <br>
	 * 
	 * @param template
	 * @param context
	 * @param logTag
	 * @return
	 */
	public static String parse(String template, Map<String, Object> context, String logTag, Properties settings) {
		if (StringUtils.isBlank(template)) {
			return template;
		}
		logTag = null == logTag ? "" : logTag;
		if (null == settings || settings.isEmpty()) {
			Velocity.init();
		} else {
			Velocity.init(settings);
		}
		VelocityContext vcontext = new VelocityContext();
		if (null != context && !context.isEmpty()) {
			for (String key : context.keySet()) {
				vcontext.put(key, context.get(key));
			}
		}
		StringWriter writer = null;
		try {
			writer = new StringWriter();
			Velocity.evaluate(vcontext, writer, logTag, template);
			writer.flush();
			String content = writer.toString();
			return content;
		} catch (Throwable t) {
			logger.error("An error occured while try to parse template.", t);
		} finally {
			IOUtils.closeQuietly(writer);
		}
		return template;
	}
	
	/**
	 * 
	 * @param templateName
	 * @param encoding
	 * @param context
	 * @return
	 */
	public static String merge(String templateName, String encoding, Map<String, Object> context) {
		return merge(templateName, encoding, context, null);
	}
	
	/**
	 * 
	 * @param templateName
	 * @param encoding
	 * @param context
	 * @param settings
	 * @return
	 */
	public static String merge(String templateName, String encoding, Map<String, Object> context, Properties settings) {
		if (StringUtils.isBlank(templateName)) {
			return templateName;
		}
		encoding = StringUtils.isBlank(encoding) ? "utf-8" : encoding; //$NON-NLS-1$
		if (null == settings || settings.isEmpty()) {
			Velocity.init();
		} else {
			Velocity.init(settings);
		}
		VelocityContext vcontext = new VelocityContext();
		if (null != context && !context.isEmpty()) {
			for (String key : context.keySet()) {
				vcontext.put(key, context.get(key));
			}
		}
		StringWriter writer = null;
		try {
			writer = new StringWriter();
			Velocity.mergeTemplate(templateName, encoding, vcontext, writer);
			writer.flush();
			String content = writer.toString();
			return content;
		} catch (Throwable t) {
			logger.error("An error occured while try to parse template.", t);
		} finally {
			IOUtils.closeQuietly(writer);
		}
		return null;
	}
	
	/**
	 * 
	 * @return
	 */
	public static Properties getClassResourceLoaderSettings() {
		Properties settings = new Properties();
		// settings.setProperty("file.resource.loader.path", "/Users/zhongwen/github/velocity/src/test/resources");
		// or
		settings.setProperty("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader"); //$NON-NLS-1$ //$NON-NLS-2$
		// settings.setProperty("file.resource.loader.path", ""); //$NON-NLS-1$ //$NON-NLS-2$
		// org.apache.velocity.runtime.resource.loader.FileResourceLoader [default]
		// org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader
		
		return settings;
	}
	
	/**
	 * 
	 * @return
	 */
	public static Properties getFileResourceLoaderSettings() {
		return getFileResourceLoaderSettings(null);
	}
	
	/**
	 * 
	 * @param path
	 * @return
	 */
	public static Properties getFileResourceLoaderSettings(String path) {
		Properties settings = new Properties();
		// settings.setProperty("file.resource.loader.path", "/Users/zhongwen/github/velocity/src/test/resources");
		// or
		settings.setProperty("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.FileResourceLoader"); //$NON-NLS-1$ //$NON-NLS-2$
		// settings.setProperty("file.resource.loader.path", ""); //$NON-NLS-1$ //$NON-NLS-2$
		if (StringUtils.isNoneBlank(path)) {
			settings.setProperty("file.resource.loader.path", path); //$NON-NLS-1$
		}
		// org.apache.velocity.runtime.resource.loader.FileResourceLoader [default]
		// org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader
		
		return settings;
	}

}
