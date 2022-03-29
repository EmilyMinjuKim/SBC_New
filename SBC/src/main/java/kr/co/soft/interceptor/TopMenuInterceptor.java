package kr.co.soft.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.soft.bean.UserBean;

public class TopMenuInterceptor implements HandlerInterceptor{
	
	//Interceptor클래스는 @Autowire를 사용 할 수 없으므로 객체 생성을 직접 구현한다.
	private UserBean loginUserBean;
	
	public TopMenuInterceptor(UserBean loginUserBean) {
		
		this.loginUserBean = loginUserBean;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		request.setAttribute("loginUserBean", loginUserBean);
		
		return true;
	}

	
	
}
