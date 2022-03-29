package kr.co.soft.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.co.soft.bean.UserBean;

public class CheckAuthorInterceptor implements HandlerInterceptor {
	
	//로그인 여부를 판단
	private UserBean loginUserBean;
	
	public CheckAuthorInterceptor(UserBean loginUserBean) {
		this.loginUserBean = loginUserBean;

	}


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		

		if (loginUserBean.getAuthority() != "ROLE_ADMIN") {
			//경로 읽어오기
			String contextPath = request.getContextPath();
			
			response.sendRedirect(contextPath + "/member/cannot_access");
		
			return false;
		}
		
		return true;
	}
	
	

}
