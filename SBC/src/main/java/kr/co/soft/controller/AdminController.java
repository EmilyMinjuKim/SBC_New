package kr.co.soft.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.soft.bean.PageNoticeBean;
import kr.co.soft.bean.UserBean;
import kr.co.soft.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Autowired
	private AdminService adminService;

	// 회원 관리 페이지 접속
	@GetMapping("userlist")
	public String userlist(@RequestParam(value = "searchUser_id", defaultValue = "false") String searchUser_id,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		PageNoticeBean pageBean=adminService.getAdminCnt(page);
		
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

}