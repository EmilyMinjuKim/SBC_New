package kr.co.soft.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/list")
public class listController {

	@GetMapping("/list")
	public String list() {
		return "list/list";
	}
	
	@GetMapping("/list1")
	public String list1() {
		return "list/insert";
	}
	
}
