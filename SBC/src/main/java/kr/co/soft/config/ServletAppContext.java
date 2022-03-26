package kr.co.soft.config;

import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.soft.bean.UserBean;
import kr.co.soft.interceptor.CheckloginInterceptor;
import kr.co.soft.interceptor.TopMenuInterceptor;
import kr.co.soft.mapper.BoardMapper;
import kr.co.soft.mapper.CartMapper;
import kr.co.soft.mapper.NoticeMapper;
import kr.co.soft.mapper.OrderMapper;
import kr.co.soft.mapper.ProductMapper;
import kr.co.soft.mapper.UserMapper;

@Configuration // <annotation-driven/>와 같음
@EnableWebMvc // controller어노테이션이 셋팅되어 있는 클래스 로드
@ComponentScan({ "kr.co.soft.controller", "kr.co.soft.dao", "kr.co.soft.service" }) // compoment어노테이션이 셋팅되어 있는 클래스 로드
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer, TransactionManagementConfigurer {

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Value("${db.classname}")
	private String db_classname;

	@Value("${db.url}")
	private String db_url;

	@Value("${db.username}")
	private String db_username;

	@Value("${db.password}")
	private String db_password;

	// =======================================================================

	// jsp의 파일이름 앞 뒤 생략
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	// 정적 파일의 경로를 매핑
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resource/");
	}

	// 데이터베이스 접속 데이터 정보 등록
	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);

		return source;
	}

	// 등록된 접속 정보와 쿼리문 관리
	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);
		SqlSessionFactory factory = factoryBean.getObject();
		return factory;
	}

	// 쿼리문 실행을 위한 객체(Mapper)
	@Bean
	public MapperFactoryBean<ProductMapper> product_mapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<ProductMapper> factoryBean = new MapperFactoryBean<ProductMapper>(ProductMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<NoticeMapper> Notice_Mapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<NoticeMapper> factoryBean = new MapperFactoryBean<NoticeMapper>(NoticeMapper.class);
		factoryBean.setSqlSessionFactory(factory);

		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<CartMapper> cart_mapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<CartMapper> factoryBean = new MapperFactoryBean<CartMapper>(CartMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<OrderMapper> order_mapper(SqlSessionFactory factory) throws Exception {

		MapperFactoryBean<OrderMapper> factoryBean = new MapperFactoryBean<OrderMapper>(OrderMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean // 쿼리문 실행을 위한 객체 (Mapper)
	public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);
		factoryBean.setSqlSessionFactory(factory);

		return factoryBean;
	}

	@Bean // 보드 매퍼 (Mapper)
	public MapperFactoryBean<BoardMapper> getBoardMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<BoardMapper> factoryBean = new MapperFactoryBean<BoardMapper>(BoardMapper.class);
		factoryBean.setSqlSessionFactory(factory);

		return factoryBean;
	}

	// =============================================================
	// 발리데이트 관련

	@Bean // 에러메시지 등록
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasenames("/WEB-INF/properties/error_message");
		return res;
	}

	// @PropertySource와 메시지 충돌 => 분리하는 코드.
	@Bean
	public static PropertySourcesPlaceholderConfigurer PropertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

	// ===========================================================
	// 인터셉트, 로그인 세션 처리 관련

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		WebMvcConfigurer.super.addInterceptors(registry);

		TopMenuInterceptor topMenuInterceptor = new TopMenuInterceptor(loginUserBean);

		InterceptorRegistration reg1 = registry.addInterceptor(topMenuInterceptor);

		reg1.addPathPatterns("/**"); // 모든 요청 주소에 AOP 등록

		// --------------------------------------------

		CheckloginInterceptor checkLoginInterceptor = new CheckloginInterceptor(loginUserBean);

		InterceptorRegistration reg2 = registry.addInterceptor(checkLoginInterceptor);

		reg2.addPathPatterns("/member/modify", "/member/logout", "/board/*");
		reg2.excludePathPatterns("/board/main");

	}

	// ======================================================================
	// 트랙잭션 매니저

	@Bean
	public PlatformTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}

	@Override
	public PlatformTransactionManager annotationDrivenTransactionManager() {
		return transactionManager();
	}

}
