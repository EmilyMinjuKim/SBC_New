package kr.co.soft.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.soft.bean.UserBean;

@Controller
@RequestMapping("/siteInfo")
public class SiteInformationController {
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@GetMapping("siteInfo")
	public String siteInfo() {
		
		return "admin/siteInfo";
	}
		

	
	
	
	

}
