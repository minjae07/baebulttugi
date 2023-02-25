package kr.board.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.entity.Member;
import kr.board.mapper.BoardMapper;

@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping("/QnA.do")
	public String main() {
		return "board/QnA";
	}

	@RequestMapping("/board.do")
	public String board() {
		return "board/main2";
	}
	
	@RequestMapping("/addBoardPage.do")
	public String addBoardPage(HttpSession session, Member member, ModelMap model) {
		String memberName = member.getMemName();
		return "board/addWrite";
	}
	
	
	
}