package kr.co.soft.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	// "/" :주소를 입력하면 무조건 HomeController를 찾아오게 하는 코드
	// form 태그와 같음(자바단에서 넘겨줄때 씌임)
	@RequestMapping(value = "/", method = RequestMethod.GET) // 루트 (프로젝트 이름)
	public String home(HttpServletRequest request) {
		System.out.println("home");
//		System.out.println(request.getServletContext().getRealPath("/"));
		return "redirect:/main"; // controller에 main
	}

}
