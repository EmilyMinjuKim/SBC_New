package kr.co.soft.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.soft.bean.UserlistBean;
import kr.co.soft.bean.UsermembershipBean;
import kr.co.soft.service.UserService;

//경로설정 주의(추가 사항 + 회원 가입 연결)
@Controller
@RequestMapping("/member")
public class UserController {

	@Autowired
	private UserService userService;

	@Resource(name = "loginUserBean")
	private UserlistBean loginUserBean;

	// 로그인 성공
	@GetMapping("/login")

	public String login(@ModelAttribute("tempLoginUserBeanT") UserlistBean temploginUserBeanT,
			@RequestParam(value = "fail", defaultValue = "false") Boolean fail, Model m) {

		System.out.println("login test");

		m.addAttribute("fail", fail);

		return "member/login";
	}

	// String값일경우 return(PostMapping값은 임의의 값을 넣어도 가능)
	// 유효성 검사(login_load로 줘야할듯)
	@PostMapping("/login_load")
	public String login_load(@ModelAttribute("tempLoginUserBeanT") UserlistBean tempLoginUserBeanT,
			BindingResult result) {

		if (result.hasErrors()) {
			System.out.println(result);
			return "member/login"; // views/logintest(login작동)
		}
		
		/*
		 * if (loginUserBean.getEnabled() == 0) { return "member/login_nonmembers"; }
		 */

		userService.getLoginUserInfo(tempLoginUserBeanT);

		if (loginUserBean.isUserLogin() == true)
			return "member/login_success";
		else
			return "member/login_fail";

	}

	
	 //회원가입(/join)
	 @GetMapping("signup") //joinUserBean 
	 public String signup(@ModelAttribute("signupUserBean") UserlistBean signupUserBean) {
	  
	 return "member/signup"; 
	 
	 }
	 

	 //회원가입(join_pro 수정함)
	 @PostMapping("/signup_load") // 기존 model joinUserBean, 기존 UserBean 
	 public String signup_load(@Valid @ModelAttribute("signupUserBean") UserlistBean signupUserBean, BindingResult result) {
	  
	  if (result.hasErrors()) 
		  return "member/signup";
	  
	  // 회원가입 경로 지정 userService.addUserInfo(signupUserBean);
	  
	  if (loginUserBean.isUserLogin()) 		  
		  return "member/login_success";
	  else 
		  return "member/join_success";
	  
	  }
	 

	 //정보수정
	  
	 @GetMapping("modify") 
	 public String modify(@ModelAttribute("modifyUserBean") UserlistBean modifyUserBean) {
	 
	 //userService.getModifyUserInfo(modifyUserBean);
	 
	 return "member/modify"; 
	 }
	 
	
	 @PostMapping("/modify_load") 
	 public String modify_pro(@Valid @ModelAttribute("modifyUserBean") UserlistBean modifyUserBean, BindingResult result) {
	
	 if (result.hasErrors()) { 
		 return "member/modify"; }
	 
	 //userService.modifyUserInfo(modifyUserBean);
	 
	 return "member/modify_success"; 
	 
	 }
	
	// 로그아웃
	@GetMapping("logout")
	public String logout() {

		loginUserBean.setUserLogin(false);

		return "member/logout";
	}

	/*
	 * 아직 쓰임새 모름
	 * 
	 * @GetMapping("/not_login") public String not_login() { return
	 * "user/not_login"; }
	 */

	// 마이페이지(테이블에 있는 user정보 끌고와야함)
	@GetMapping("mypage")
	public String mypage() {

		return "member/mypage";
	}

	@GetMapping("searchId")
	public String searchId(UsermembershipBean usermembershipBean) {

		return "member/searchId";
	}

	@PostMapping("searchId_pro")
	public String searchId_pro(@Valid @ModelAttribute("usermembershipBean") UsermembershipBean usermembershipBean,
			BindingResult result, Model model) {

		if (result.hasErrors()) {
			System.out.println(result);

			return "member/searchId";
		}

		UsermembershipBean membershipBean2 = userService.searchIdByEmail(usermembershipBean);

		if (membershipBean2 == null) {
			return "member/searchId_fail";
		} else {
			model.addAttribute("membershipBean2", membershipBean2);
			return "member/searchId_success";
		}

	}

	@GetMapping("searchPassword")
	public String searchPassword(UserlistBean userlistBean) {

		return "member/searchPassword";
	}
	
	@PostMapping("searchPassword_proc")
	public String searchPassword_proc(@Valid @ModelAttribute("userlistBean") UserlistBean userlistBean, BindingResult result, Model model) {
		
		return "member/serchPassword_success";
	}
	
	/*
	 * @InitBinder // 등록 된 validator 사용. public void initBinder(WebDataBinder
	 * binder) { UserValidator validator1 = new UserValidator();
	 * binder.addValidators(validator1); }
	 */
}