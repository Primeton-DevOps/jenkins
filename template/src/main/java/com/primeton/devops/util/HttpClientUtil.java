/*******************************************************************************
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 17, 2016 10:21:31 AM
 *******************************************************************************/

package com.primeton.devops.util;

import java.io.IOException;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.primeton.devops.common.Constants;

/**
 * HttpClientUtil.
 * 
 * @author ZhongWen Li (mailto:lizw@primeton.com)
 */
public class HttpClientUtil implements Constants {

	private static Logger logger = Logger
			.getLogger(HttpClientUtil.class);

	private HttpClientUtil() {
	}
	
	public static class HttpClient {
		
		private CloseableHttpClient client;
		private String session;
		private String crumb;
		private String crumbRequestField;
		
		/**
		 * @param client
		 * @param session
		 */
		public HttpClient(CloseableHttpClient client, String session) {
			super();
			this.client = client;
			this.session = session;
		}

		/**
		 * @param client
		 * @param session
		 * @param crumb
		 * @param crumbRequestField
		 */
		public HttpClient(CloseableHttpClient client, String session, String crumb, String crumbRequestField) {
			super();
			this.client = client;
			this.session = session;
			this.crumb = crumb;
			this.crumbRequestField = crumbRequestField;
		}

		/**
		 * @return Returns the client.
		 */
		public CloseableHttpClient getClient() {
			return client;
		}

		/**
		 * @return Returns the session.
		 */
		public String getSession() {
			return session;
		}

		/**
		 * @return Returns the crumb.
		 */
		public String getCrumb() {
			return crumb;
		}

		/**
		 * @return Returns the crumbRequestField.
		 */
		public String getCrumbRequestField() {
			return crumbRequestField;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	private static HttpClient getClient() {
		/*
		URI uri = URI.create(JENKINS_URL);
		HttpHost host = new HttpHost(uri.getHost(), uri.getPort(), uri.getScheme());
		CredentialsProvider credsProvider = new BasicCredentialsProvider();
		credsProvider.setCredentials(
				new AuthScope(uri.getHost(), uri.getPort()),
				new UsernamePasswordCredentials(JENKINS_USER, JENKINS_PASS));
		// Create AuthCache instance
		AuthCache authCache = new BasicAuthCache();
		// Generate BASIC scheme object and add it to the local auth cache
		BasicScheme basicAuth = new BasicScheme();
		authCache.put(host, basicAuth);
		CloseableHttpClient client = HttpClients.custom().setDefaultCredentialsProvider(credsProvider).build();
		HttpGet httpGet = new HttpGet(uri);
		// Add AuthCache to the execution context
		HttpClientContext localContext = HttpClientContext.create();
		localContext.setAuthCache(authCache);

		try {
			HttpResponse response = client.execute(host, httpGet, localContext);
			System.out.println(EntityUtils.toString(response.getEntity()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost request = new HttpPost(getFullURL("/j_acegi_security_check")); //$NON-NLS-1$
		HttpGet getRequest = new HttpGet(getFullURL("/crumbIssuer/api/json")); //$NON-NLS-1$
		List<NameValuePair> parameters = new ArrayList<>();
		parameters.add(new BasicNameValuePair("j_username", JENKINS_USER)); //$NON-NLS-1$
		parameters.add(new BasicNameValuePair("j_password", JENKINS_PASS)); //$NON-NLS-1$
		UrlEncodedFormEntity entity = null;
		try {
			entity = new UrlEncodedFormEntity(parameters);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		request.setEntity(entity);
		String session = null;
		String crumb = null;
		String crumbRequestField = null;
		try {
			HttpResponse response = client.execute(request);
			Header header = response.getFirstHeader("Set-Cookie");
			for (HeaderElement e : header.getElements()) {
				if (e.getName().startsWith("JSESSIONID")) {
					session = e.getValue();
				}
			}
			System.out.println(response.getStatusLine().getStatusCode());
			
			getRequest.addHeader("Accept", "application/json");
			response = client.execute(getRequest);
			String content = EntityUtils.toString(response.getEntity());
			System.err.println(content);
			Map<String, String> message = new ObjectMapper().readValue(content, Map.class);
			crumbRequestField = message.get("crumbRequestField");
			crumb = message.get("crumb");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new HttpClient(client, session, crumb, crumbRequestField);
	}
	
	/**
	 * 
	 * @param restURL
	 * @return
	 */
	public static String getFullURL(String restURL) {
		if (null == restURL) {
			return null;
		}
		return JENKINS_URL + restURL;
	}

	/**
	 * 
	 * @param client
	 * @param method
	 *            get|delete
	 * @param url
	 * @param headers
	 * @return
	 */
	public static HttpResult sendRequest(String method, String url,
			Map<String, String> headers) throws Exception {
		HttpClient httpClient = getClient();
		CloseableHttpClient client = httpClient.getClient();
		if (null == client || StringUtils.isEmpty(url)) {
			return null;
		}
		if ("POST".equalsIgnoreCase(method)
				|| "PUT".equalsIgnoreCase(method)) {
			return sendRequest(method, url, headers, null);
		}
		HttpRequestBase request = "DELETE".equalsIgnoreCase(method) ? new HttpDelete(
				url) : new HttpGet(url);
		if (null != headers && !headers.isEmpty()) {
			for (String name : headers.keySet()) {
				request.addHeader(name, headers.get(name));
			}
		}
		// jenkins
		request.addHeader(httpClient.getCrumbRequestField(), httpClient.getCrumb());
		
		CloseableHttpResponse response = null;
		try {
			logger.debug(String.format("Send %s request to %s.", method, url));
			response = client.execute(request);
			int status = response.getStatusLine().getStatusCode();
			String content = getContent(response);
			return new HttpResult(status, content);
		} catch (Throwable e) {
			throw new Exception(e);
		} finally {
			IOUtils.closeQuietly(response);
		}
	}

	/**
	 * 
	 * @param client
	 * @param method
	 *            post|delete|put
	 * @param url
	 * @param headers
	 * @param entity
	 *            HttpEntity or String or JavaBean or null
	 * @return
	 */
	public static HttpResult sendRequest(String method, String url,
			Map<String, String> headers, Object entity) throws Exception {
		HttpClient httpClient = getClient();
		CloseableHttpClient client = httpClient.getClient();
		if (null == client || StringUtils.isEmpty(url)) {
			return null;
		}
		if ("GET".equalsIgnoreCase(method)
				|| "DELETE".equalsIgnoreCase(method)) {
			if (null == entity) {
				return sendRequest(method, url, headers);
			} else {
				throw new RuntimeException("Method error, can not send"
						+ method + " request with entity data " + entity + ".");
			}
		}
		HttpEntityEnclosingRequestBase request = "PUT".equalsIgnoreCase(method) ? new HttpPut(url)
				: new HttpPost(url);
		if (null != headers && !headers.isEmpty()) {
			for (String name : headers.keySet()) {
				request.addHeader(name, headers.get(name));
			}
		}
		// jenkins
		request.addHeader(httpClient.getCrumbRequestField(), httpClient.getCrumb());
		
		if (null != entity) {
			if (entity instanceof HttpEntity) {
				request.setEntity((HttpEntity) entity);
			} else if (entity instanceof String) {
				request.setEntity(new StringEntity((String) entity,
						ContentType.TEXT_PLAIN));
			} else {
				request.setEntity(new StringEntity(new ObjectMapper()
						.writeValueAsString(entity),
						ContentType.APPLICATION_JSON));
			}
		}
		CloseableHttpResponse response = null;
		try {
			response = client.execute(request);
			int status = response.getStatusLine().getStatusCode();
			String content = getContent(response);
			return new HttpResult(status, content);
		} catch (Throwable e) {
			throw new Exception(e);
		} finally {
			IOUtils.closeQuietly(response);
		}
	}

	/**
	 * 
	 * @param response
	 * @return
	 */
	public static String getContent(CloseableHttpResponse response)
			throws Exception {
		if (null == response) {
			return null;
		}
		HttpEntity entity = response.getEntity();
		return null == entity ? null : EntityUtils.toString(entity, "UTF-8"); //$NON-NLS-1$
		
		/*
		if (null == entity) {
			return null;
		}
		InputStream inputStream = null;
		try {
			inputStream = entity.getContent();
			return IOUtils.toString(inputStream, "utf-8"); //$NON-NLS-1$
		} catch (Throwable e) {
			throw new Exception(e);
		} finally {
			IOUtils.closeQuietly(inputStream);
		}
		*/
	}

	/**
	 * If error, return error message. <br>
	 * 
	 * @param response
	 * @return
	 */
	public static String getContentIgnoreError(CloseableHttpResponse response) {
		try {
			return getContent(response);
		} catch (Exception e) {
			return e.getMessage();
		}
	}
	
	/**
	 * 
	 * HttpResult.
	 *
	 * @author ZhongWen Li (mailto:lizw@primeton.com)
	 */
	public static class HttpResult implements Serializable {

		/**
		 * <code>serialVersionUID</code>
		 */
		private static final long serialVersionUID = 7364653914616309925L;
		
		private int status;
		private String content;
		
		/**
		 * 
		 */
		public HttpResult() {
			super();
		}

		/**
		 * @param status
		 * @param content
		 */
		public HttpResult(int status, String content) {
			super();
			this.status = status;
			this.content = content;
		}

		/**
		 * @return Returns the status.
		 */
		public int getStatus() {
			return status;
		}

		/**
		 * @param status The status to set.
		 */
		public void setStatus(int status) {
			this.status = status;
		}

		/**
		 * @return Returns the content.
		 */
		public String getContent() {
			return content;
		}

		/**
		 * @param content The content to set.
		 */
		public void setContent(String content) {
			this.content = content;
		}

		/* (non-Javadoc)
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			return "HttpResult [status=" + status + ", content=" + content
					+ "]";
		}
		
	}

}
