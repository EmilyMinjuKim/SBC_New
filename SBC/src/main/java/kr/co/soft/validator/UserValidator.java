package kr.co.soft.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.soft.bean.UserlistBean;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return UserlistBean.class.isAssignableFrom(clazz);
	}

	@Override // 커스터 마이징 할 클래스 등록
	public void validate(Object target, Errors errors) {

		UserlistBean UserlistBean = (UserlistBean) target;

		// UserlistBean의 객체 중에서 유효성 검사를 할 객체만 사용하기 위한 name추출
		String beanName = errors.getObjectName();

		System.out.println("현재 접속 정보는?" + beanName);
	
		if(beanName.equals("signupUserlistBean")) {
			
			if(UserlistBean.getUser_password().equals(UserlistBean.getUser_password2())==false) {
				errors.rejectValue("user_password", "NotEquals");
				errors.rejectValue("user_password2", "NotEquals");
			}
			
			if (!UserlistBean.isUserIdExist()) {
				errors.rejectValue("user_id", "ExistID");
			}
		}
		
		/* 기존 쌤 code
		if (beanName.equals("joinUserlistBean")) {

			if (UserlistBean.getUser_pw().equals(UserlistBean.getUser_pw2()) == false) {
				errors.rejectValue("user_pw", "NotEq");
				errors.rejectValue("user_pw2", "NotEq");
			}
			
			if (!UserlistBean.isUserIdExist()) {
				errors.rejectValue("user_id", "ExistID");
			}
		}
		*/
	}
}