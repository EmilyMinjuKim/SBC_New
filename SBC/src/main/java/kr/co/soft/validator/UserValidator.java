package kr.co.soft.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.soft.bean.UserBean;
import kr.co.soft.dao.UserDao;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return UserBean.class.isAssignableFrom(clazz);
	}

	@Override // 커스터 마이징 할 클래스 등록
	public void validate(Object target, Errors errors) {

		UserBean userBean = (UserBean) target;

		// UserlistBean의 객체 중에서 유효성 검사를 할 객체만 사용하기 위한 name추출
		String beanName = errors.getObjectName();

		System.out.println("현재 접속 정보는?" + beanName);
		
		UserDao dao = new UserDao();

		if (beanName.equals("signupBean") || beanName.equals("modifyUserBean")) {

			if (userBean.getUser_password().equals(userBean.getUser_password2()) == false) {
				System.out.println("비밀번호 불일치 에러 탐지");
				errors.rejectValue("user_password", "NotEquals");
				errors.rejectValue("user_password2", "NotEquals");
			}
			
			if (beanName.equals("signupBean")) {
				if(!userBean.isUserIdExist()) {
					System.out.println("아이디 체크 여부 미확인 에러");
					errors.rejectValue("user_id", "DontCheckUserIdExist");
				}
				if (!userBean.isUserEmailExist()) {
					System.out.println("이메일 체크 여부");
					errors.rejectValue("email", "DontCheckUserEmailExist");
				}
			}

//			if (userBean.isUserIdExist() == false) {
//				System.out.println("아이디 체크 여부 미확인 에러");
//				errors.rejectValue("user_id", "DontCheckUserIdExist");
//			}
//			
//			if (userBean.isUserEmailExist() == false) {
//				System.out.println("이메일 체크 여부");
//				errors.rejectValue("email", "DontCheckUserEmailExist");
//			}
			
		
			
			

		}

	}
}