/**
 * 
 */
package com.primeton.devops.freemarker;

import java.io.File;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

/**
 * @author ZhongWen (mailto:lizhongwen1989@gmail.com)
 *
 */
public class HelloFreeMarker {
	
	public static void main(String[] args) throws Exception {
		
		Configuration cfg = new Configuration(Configuration.VERSION_2_3_23);

		// Windows
		cfg.setDirectoryForTemplateLoading(new File("D:\\github\\jenkins\\freemarker\\src\\main\\resources\\templates"));
		// MacOS
//		cfg.setDirectoryForTemplateLoading(new File("~/github/jenkins/freemarker/src/main/resources/templates"));

		cfg.setDefaultEncoding("UTF-8");
		
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		
		cfg.setLogTemplateExceptions(false);
		
		// Create the root hash. We use a Map here, but it could be a JavaBean too.
		Map<String, Object> root = new HashMap<>();

		// Put string "user" into the root
		root.put("user", "Big Joe");

		// Create the "latestProduct" hash. We use a JavaBean here, but it could be a Map too.
		Product latest = new Product();
		latest.setUrl("products/greenmouse.html");
		latest.setName("green mouse");
		// and put it into the root
		root.put("latestProduct", latest);
		
		Template template = cfg.getTemplate("HelloWorld.ftlh");
		
		Writer out = new OutputStreamWriter(System.out);
		template.process(root, out);

	}
	
	/**
	 * Product bean; note that it must be a public class!
	 */
	public static class Product {

	    private String url;
	    private String name;

	    // As per the JavaBeans spec., this defines the "url" bean property
	    // It must be public!
	    public String getUrl() {
	        return url;
	    }

	    public void setUrl(String url) {
	        this.url = url;
	    }

	    // As per the JavaBean spec., this defines the "name" bean property
	    // It must be public!
	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	}

}
