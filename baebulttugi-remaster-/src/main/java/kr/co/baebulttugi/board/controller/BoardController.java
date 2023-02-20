package kr.co.baebulttugi.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/board.do")
	public String main() {
		return "board/main";
	}
	
}
