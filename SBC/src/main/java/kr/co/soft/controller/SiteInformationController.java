package kr.co.soft.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.soft.bean.UserBean;
import kr.co.soft.dao.BoardDao;
import kr.co.soft.service.SiteInfoService;
import kr.co.soft.service.UserServiceImpl;
import kr.co.soft.service.VisitCountService;

@Controller
@RequestMapping("/siteInfo")
public class SiteInformationController {

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Autowired
	private UserServiceImpl userService;

	@Autowired
	private SiteInfoService siteInfoService;

	@Autowired
	private VisitCountService visitCountService;
	
	@Autowired
	private BoardDao boardDao;
	

	@GetMapping("siteInfo")
	public String siteInfo(Model model) {

		// 접속자 정보 가져오기
		model.addAttribute("loginUserBean", loginUserBean);

		// 접속자 위치 정보
		try {
			String ip = userService.getUserIp();

			model.addAttribute("ip", ip);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 현재 회원수 토탈
		String cnt = siteInfoService.userCount();
		model.addAttribute("cnt", cnt);

		// 총 방문자 수
		int totalCount = visitCountService.getTotalCount();
		model.addAttribute("totalCount", totalCount);

		// 오늘 방문자 수
		int todayCount = visitCountService.getTodayCount();
		model.addAttribute("todayCount", todayCount);
		
		// 오늘 가입자 수
		int todaySignUp = visitCountService.getNewSignup();
		model.addAttribute("todaySignUp", todaySignUp);
		
		// 오늘 총 주문 수
		int todayOrderCount = siteInfoService.getTodayOrderCount(); 
		model.addAttribute("todayOrderCount", todayOrderCount);
	
		// 등록된 총 게시글 수
		int boardCurrent_cnt = boardDao.getContentCnt();
		model.addAttribute("boardCurrent_cnt", boardCurrent_cnt);
		
		
		int total_amount = siteInfoService.getTotal_amount();
		model.addAttribute("total_amount", total_amount);

		
		

		return "admin/siteInfo";
		
		
		
		
		
	}

}
