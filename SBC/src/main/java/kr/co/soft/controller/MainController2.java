package kr.co.soft.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MainController2 {

	@GetMapping("maintest") //경로값
	public String main() {
		return "member/maintest";
	}

}
