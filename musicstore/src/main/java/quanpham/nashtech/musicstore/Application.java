package quanpham.nashtech.musicstore;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import quanpham.nashtech.musicstore.config.RootConfig;
import quanpham.nashtech.musicstore.config.SecurityConfig;
import quanpham.nashtech.musicstore.config.WebConfig;

public class Application extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] { RootConfig.class ,SecurityConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { WebConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

}
