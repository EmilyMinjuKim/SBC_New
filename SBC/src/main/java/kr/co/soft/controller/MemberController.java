package kr.co.soft.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import kr.co.soft.service.VisitCountService;
import kr.co.soft.validator.UserValidator;

//경로설정 주의(추가 사항 + 회원 가입 연결)
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private UserServiceImpl userService;

	@Autowired
	private VisitCountService visitCountService;

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
			BindingResult result, Model model, HttpServletRequest request) throws Exception {

		if (result.hasErrors()) {
			System.out.println(result);
			return "member/login"; // views/logintest(login작동)
		}

		userService.getLoginUserInfo(tempLoginUserBeanT);
		String ip = userService.getUserIp();

		System.out.println(ip);

		tempLoginUserBeanT.setRecentlogin_ip(ip);

		if (loginUserBean.isUserLogin() == true) {

			// 로그인 성공시, 로그에 접속 타임과 아이피 업데이트

			System.out.println(tempLoginUserBeanT.getRecentlogin_ip());

			userService.updateRecentlogin_ipByUser_id(tempLoginUserBeanT);

			HttpSession session = request.getSession(true);
			session.setAttribute("loginUserBean", loginUserBean);
			session.setMaxInactiveInterval(3600);

			visitCountService.setTotalCount();

			UserBean ub = (UserBean) session.getAttribute("loginUserBean");

			System.out.println("세션값 아이디" + ub.getUser_id());
			System.out.println("로그인 상태 확인" + ub.isUserLogin());

			return "member/login_success";
		}

		else {
			return "member/login_fail";
		}

	}

	@GetMapping("/not_login")
	public String not_login() {

		return "member/not_login";
	}

	@GetMapping("/cannot_access")
	public String cannot_access() {

		return "member/cannot_access";
	}

	// 회원가입(/s)
	@GetMapping("signup")
	String signup(@ModelAttribute("signupBean") UserBean signupBean) {

		return "member/signup";

	}

	// 회원가입(join_pro 수정함)
	@PostMapping("/signup_pro") // 기존 model joinUserBean, 기존 UserBean public
	public String signup_load(@Valid @ModelAttribute("signupBean") UserBean signupBean, BindingResult result, Model model) {

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
		
		try {
			userService.sendEmail(signupBean, "join");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("signupBean", signupBean);

		return "member/join_success";

	}
	
	@GetMapping("/registerEmail")
	public String registerEmail(@RequestParam(value = "email") String email, 
			@RequestParam(value = "approval_key") String approval_key) {

		System.out.println("레지스터 이메일");
		
		if (userService.checkApproval_keyByEmail(email, approval_key) == 0) {
			return "member/register_fail";
		}
		
		userService.updateEnabledByEmail(email);
		
		return "member/register_success";
	} 
	
	
	// 아이디 유무 체크
	@ResponseBody
	@GetMapping("/checkUserIdExist/{user_id}")
	public String checkUserIdExist(@PathVariable("user_id") String user_id) {

		// System.out.println("아작스 움직임 테스"+user_id);
		return userService.checkUserIdExist(user_id);

	}

	// 이메일 유무 체크
	@ResponseBody
	@GetMapping("/checkUserEmailExist/{email}")
	public String checkUserEmailExist(@PathVariable("email") String email) {

		// System.out.println("아작스 움직임 테스"+user_id);
		return userService.checkUserEmailExist(email);

	}

	// 로그아웃
	@GetMapping("logout")
	public String logout() {

		loginUserBean.setUserLogin(false);

		return "member/logout";
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

	// 정보수정
	@GetMapping("modify")
	public String modify(@ModelAttribute("modifyUserBean") UserBean modifyUserBean) {

		// 정보 불러와서 form에 넣음
		UserBean u = userService.getModifyUserlistInfo(loginUserBean.getUser_id());
		UserBean u1 = userService.getModifyUserMemberInfo(loginUserBean.getUser_id());

		// Userlist
		modifyUserBean.setUser_id(u.getUser_id());
		modifyUserBean.setUser_password(u.getUser_password());
		modifyUserBean.setEmail(u.getEmail());
		// UserMembership
		modifyUserBean.setUser_name(u1.getUser_name());
		modifyUserBean.setPhone(u1.getPhone());
		modifyUserBean.setPostcode(u1.getPostcode());
		modifyUserBean.setAddress1(u1.getAddress1());
		modifyUserBean.setAddress2(u1.getAddress2());
		modifyUserBean.setGender(u1.getGender());
		modifyUserBean.setBirthdate(u1.getBirthdate());

		return "member/modify";
	}

	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyUserBean") UserBean modifyUserBean, BindingResult result) {
		
		if (result.hasErrors()) {
			System.out.println("무슨 에러? : " + result);
			return "member/modify";
		}
		
		String pw = modifyUserBean.getUser_password();
		String salt = userService.generateSalt();

		String encryptpww = userService.getEncrypt(pw, salt);

		modifyUserBean.setUser_password(encryptpww);
		modifyUserBean.setSalt(salt);
		

		try {
			userService.updateUserlistModify(modifyUserBean);
			userService.updateMembershiModify(modifyUserBean);
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*
		 * try { userService.updateUserlistModify(modifyUserBean);
		 * userService.updateMembershiModify(modifyUserBean);
		 * 
		 * }catch(Exception e) { e.printStackTrace(); }
		 */

		System.out.println("업데이트 확인");

		return "member/modify_success";

	}

	@GetMapping("/modify_delete")
	public String modify_delete(HttpSession session) {

		try {
			userService.deleteUserEna(loginUserBean.getUser_id());
			System.out.println("try로 왔다");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("catch다");
		}

		System.out.println(loginUserBean.getUser_id());
		System.out.println(loginUserBean.getEnabled());
		System.out.println("탈퇴완료");

		session.invalidate();

		return "member/delete_success";
	}

	@InitBinder // 등록 된 validator 사용.
	public void initBinder(WebDataBinder binder) {
		UserValidator validator1 = new UserValidator();
		binder.addValidators(validator1);
	}

}