package com.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.dao.AuthorDao;
import com.dao.AuthorDaoImpl;
import com.dao.JudgeDao;
import com.dao.JudgeDaoImpl;
import com.dao.OCCDao;
import com.dao.OCCDaoImpl;

@Configuration
@ComponentScan(basePackages = {"com"})
@EnableWebMvc
public class SpringWebConfig extends WebMvcConfigurerAdapter{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver vr = new InternalResourceViewResolver();
		vr.setViewClass(JstlView.class);
		vr.setPrefix("/WEB-INF/views/");
		vr.setSuffix(".jsp");
		return vr;
	}
	
	@Bean(name = "authorDao")
	public AuthorDao authorDao() {
		return new AuthorDaoImpl();
	}
	
	@Bean(name = "occDao")
	public OCCDao occDao() {
		return new OCCDaoImpl();
	}
	
	@Bean(name = "judgeDao")
	public JudgeDao judgeDao() {
		return new JudgeDaoImpl();
	}
}
