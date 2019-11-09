package com.shaoyujian.JavaRunWeb;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.resource.GzipResourceResolver;
import org.springframework.web.servlet.resource.PathResourceResolver;


@Configuration
public class MvcConfigurer extends WebMvcConfigurerAdapter {

	private static final Logger logger = LoggerFactory.getLogger(MvcConfigurer.class);


	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/static/**")
				.addResourceLocations("classpath:/static/")
				.setCachePeriod(18000).resourceChain(true)
				.addResolver(new GzipResourceResolver())
				.addResolver(new PathResourceResolver());
	}
	
}
