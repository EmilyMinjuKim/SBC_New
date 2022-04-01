package kr.co.soft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.soft.bean.PageNoticeBean;
import kr.co.soft.bean.UserBean;
import kr.co.soft.dao.AdminDao;
import kr.co.soft.dao.UserDao;
import kr.co.soft.service.AdminService;
import kr.co.soft.service.UserServiceImpl;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Autowired
	private AdminService adminService;

	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private UserDao userDao;

	// 회원 관리 페이지 접속
	@GetMapping("userlist")
	public String userlist(@RequestParam(value = "searchUser_id", defaultValue = "false") String searchUser_id,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		PageNoticeBean pageBean = adminService.getAdminCnt(page);

		String user_id = searchUser_id;

		System.out.println("이거뭐임" + user_id);

		if (searchUser_id.equals("false")) {

			List<UserBean> userlist = adminService.getUserList(page);
			model.addAttribute("userlist", userlist);
			model.addAttribute("pageBean", pageBean);
			model.addAttribute("page", page);

		} else {

			System.out.println("이게 발동함?");

			List<UserBean> userlist = adminService.getUserInfo(user_id);

			model.addAttribute("userlist", userlist);

		}

		return "admin/userlist";
	}

	@GetMapping("userDelete")
	public String updateUserEnabled(@RequestParam String user_id, Model model) {

		adminService.updateUserEnabled(user_id);

		return "redirect:userlist?searchUser_id=" + user_id;

	}

	@GetMapping("userAbled")
	public String updateUserAbled(@RequestParam String user_id, Model model) {

		adminService.updateUserAbled(user_id);

		return "redirect:userlist?searchUser_id=" + user_id;

	}

	@GetMapping("updateRole")
	public String updateRole(@RequestParam String user_id, @RequestParam String authority, Model model) {

		if (authority.equals("ROLE_ADMIN")) {

			authority = "ROLE_USER";
			adminService.updateRole(authority, user_id);

		} else {

			authority = "ROLE_ADMIN";
			adminService.updateRole(authority, user_id);
		}

		return "redirect:userlist?searchUser_id=" + user_id;
	}

	@GetMapping("modifyUser")
	public String modifyUser(@RequestParam String user_id,
			@ModelAttribute("adminModifyUserBean") UserBean adminModifyUserBean) {

		// 정보 불러와서 form에 넣음
		UserBean u = userService.getModifyUserlistInfo(user_id);
		UserBean u1 = userService.getModifyUserMemberInfo(user_id);

		// Userlist
		adminModifyUserBean.setUser_id(u.getUser_id());
		// adminModifyUserBean.setUser_password(u.getUser_password());
		adminModifyUserBean.setEmail(u.getEmail());
		// UserMembership
		adminModifyUserBean.setUser_name(u1.getUser_name());
		adminModifyUserBean.setPhone(u1.getPhone());
		adminModifyUserBean.setPostcode(u1.getPostcode());
		adminModifyUserBean.setAddress1(u1.getAddress1());
		adminModifyUserBean.setAddress2(u1.getAddress2());
		adminModifyUserBean.setGender(u1.getGender());
		adminModifyUserBean.setBirthdate(u1.getBirthdate());

		return "admin/modifyforadmin";
	}

	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("adminModifyUserBean") UserBean adminModifyUserBean) {

		/*
		 * if (adminModifyUserBean.getUser_password() == null) {
		 * 
		 * String encryptpww =
		 * adminService.getUser_passwordByUser_id(adminModifyUserBean.getUser_id());
		 * String salt =
		 * adminService.getSaltByUser_id(adminModifyUserBean.getUser_id());
		 * 
		 * adminModifyUserBean.setUser_password(encryptpww);
		 * adminModifyUserBean.setSalt(salt);
		 * 
		 * } else {
		 * 
		 * String pw = adminModifyUserBean.getUser_password(); String salt =
		 * userService.generateSalt();
		 * 
		 * String encryptpww = userService.getEncrypt(pw, salt);
		 * 
		 * adminModifyUserBean.setUser_password(encryptpww);
		 * adminModifyUserBean.setSalt(salt);
		 * 
		 * }
		 */

		try {
			userService.updateUserlistModify(adminModifyUserBean);

		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			userService.updateMembershiModify(adminModifyUserBean);

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

		return "admin/modify_success";

	}

	@ResponseBody
	@GetMapping("sendEmail/{user_id}/{email}")
	public void sendEmail(HttpServletResponse response, @PathVariable("user_id") String user_id,
			@PathVariable("email") String email) throws IOException {

		PrintWriter out = response.getWriter();
		
		UserBean adminModifyUserBean = new UserBean();
		
		adminModifyUserBean.setUser_id(user_id);
		adminModifyUserBean.setEmail(email);

		String pw = "";
		for (int i = 0; i < 8; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		for (int i = 0; i < 3; i++) {
			pw += (int) (Math.random() * 10);
		}

		adminModifyUserBean.setUser_password(pw);

		try {
			userService.sendEmail(adminModifyUserBean, "find_pw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();

			// 발송된 비밀번호 암호화
			String salt = userService.generateSalt();
			String encryptpww = userService.getEncrypt(pw, salt);

			adminModifyUserBean.setUser_password(encryptpww);
			adminModifyUserBean.setSalt(salt);

			// 비밀번호 변경
			userDao.updatePassword(adminModifyUserBean);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			out.print("전송 실패 했습니다.");
			out.close();
		}

	}

}