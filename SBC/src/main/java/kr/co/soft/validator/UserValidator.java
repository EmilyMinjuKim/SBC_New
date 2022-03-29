package kr.co.soft.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.soft.bean.UserBean;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return UserBean.class.isAssignableFrom(clazz);
	}

	@Override // 커스터 마이징 할 클래스 등록
	public void validate(Object target, Errors errors) {

		UserBean signupBean = (UserBean) target;

		// UserlistBean의 객체 중에서 유효성 검사를 할 객체만 사용하기 위한 name추출
		String beanName = errors.getObjectName();

		System.out.println("현재 접속 정보는?" + beanName);

		if (beanName.equals("signupBean")) {

			if (signupBean.getUser_password().equals(signupBean.getUser_password2()) == false) {
				System.out.println("비밀번호 불일치 에러 탐지");
				errors.rejectValue("user_password", "NotEquals");
				errors.rejectValue("user_password2", "NotEquals");
			}

			if (signupBean.isUserIdExist() == false) {
				System.out.println("아이디 체크 여부 미확인 에러");
				errors.rejectValue("user_id", "DontCheckUserIdExist");
			}

		}

	}
}