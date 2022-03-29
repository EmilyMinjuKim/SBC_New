package kr.co.soft.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.co.soft.bean.UserBean;

public class CheckloginInterceptor implements HandlerInterceptor {
	
	//로그인 여부를 판단
	private UserBean loginUserBean;
	
	public CheckloginInterceptor(UserBean loginUserBean) {
		this.loginUserBean = loginUserBean;

	}


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("핸들러 테스트" + loginUserBean.getUser_id());

		if (loginUserBean.isUserLogin() == false) {
			//경로 읽어오기
			String contextPath = request.getContextPath();
			
			response.sendRedirect(contextPath + "/member/not_login");
			return false;
		}
		//로그인이 된 상태
		return true;
	}
	
	

}
