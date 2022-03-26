package kr.co.soft.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.soft.bean.UserBean;
import kr.co.soft.service.UserServiceImpl;
import kr.co.soft.validator.UserValidator;

//경로설정 주의(추가 사항 + 회원 가입 연결)
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private UserServiceImpl userService;

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	// 로그인
	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginUserBeanT") UserBean temploginUserBeanT,
			@RequestParam(value = "fail", defaultValue = "false") String fail, Model m) {

		System.out.println("login test");

		m.addAttribute("fail", fail);

		return "member/login";
	}

	// String값일경우 return(PostMapping값은 임의의 값을 넣어도 가능)
	// 유효성 검사(login_load로 줘야할듯)
	@PostMapping("/login_load")
	public String login_load(@Valid @ModelAttribute("tempLoginUserBeanT") UserBean tempLoginUserBeanT,
			BindingResult result, Model m) {

		if (result.hasErrors()) {
			System.out.println(result);
			return "member/login"; // views/logintest(login작동)
		}

		userService.getLoginUserInfo(tempLoginUserBeanT);

		if (loginUserBean.isUserLogin() == true) {

			System.out.println("세션 저장값 확인" + loginUserBean.isUserLogin());
			System.out.println("세션 아이디 확인" + loginUserBean.getUser_id());
			m.addAttribute("user", loginUserBean);
			return "member/login_success";
		}

		else {
			return "member/login_fail";
		}

	}

	// 회원가입(/s)
	@GetMapping("signup")
	String signup(@ModelAttribute("signupBean") UserBean signupBean) {

		return "member/signup";

	}

	// 회원가입(join_pro 수정함)
	@PostMapping("/signup_pro") // 기존 model joinUserBean, 기존 UserBean public
	public String signup_load(@Valid @ModelAttribute("signupBean") UserBean signupBean, BindingResult result) {

		System.out.println("가입시도 1");

		if (result.hasErrors()) { // 유효성 검사를 통하가지 못하게 된다면

			System.out.println("에러 발생 2");
			System.out.println("에러종류?" + result);

			return "member/signup";
		}

		try {
			userService.addUserlistInfo(signupBean);

		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			userService.addMembershipInfo(signupBean);

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("가입 성공");

		return "member/join_success";

	}

	@ResponseBody
	@GetMapping("/checkUserIdExist/{user_id}")
	public String checkUserIdExist(@PathVariable("user_id") String user_id) {

		// System.out.println("아작스 움직임 테스"+user_id);
		return userService.checkUserIdExist(user_id);

	}

	// 로그아웃
	@GetMapping("logout")
	public String logout() {

		loginUserBean.setUserLogin(false);

		return "member/logout";
	}

	// 마이페이지(테이블에 있는 user정보 끌고와야함)
	@GetMapping("mypage")
	public String mypage() {

		return "member/mypage";
	}

	@GetMapping("searchId")
	public String searchId(UserBean userlistBean) {

		return "member/searchId";
	}

	@PostMapping("searchId_pro")
	public String searchId_pro(@Valid @ModelAttribute("userlistBean") UserBean userlistBean, BindingResult result,
			Model model) {

		if (result.hasErrors()) {
			System.out.println(result);

			return "member/searchId";
		}

		UserBean membershipBean2 = userService.searchIdByEmail(userlistBean);

		if (membershipBean2 == null) {
			return "member/searchId_fail";
		} else {
			model.addAttribute("membershipBean2", membershipBean2);
			return "member/searchId_success";
		}

	}

	@GetMapping("searchPassword")
	public String searchPassword(UserBean userlistBean) {

		return "member/searchPassword";
	}

	@PostMapping("find_pw")
	public void find_pw(@ModelAttribute("userlistBean") UserBean userlistBean, HttpServletResponse response)
			throws Exception {

		// System.out.println("아작스 작동함");

		userService.find_pw(response, userlistBean);

	}

	@InitBinder // 등록 된 validator 사용.
	public void initBinder(WebDataBinder binder) {
		UserValidator validator1 = new UserValidator();
		binder.addValidators(validator1);
	}

}