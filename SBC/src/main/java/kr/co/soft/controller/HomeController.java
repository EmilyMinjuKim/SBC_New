package kr.co.soft.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	// "/" :주소를 입력하면 무조건 HomeController를 찾아오게 하는 코드
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home() {
//
//		return "redirect:/main";
//	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		System.out.println(req.getServletContext().getRealPath("/"));
		return "redirect:/main";
	}

}
