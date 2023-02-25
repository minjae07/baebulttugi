package kr.board.controller;

import java.util.List;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@Controller
public class MainController {

	@Autowired
	private BoardMapper mapper;
	
	@RequestMapping("/")
	public String index(Model model) {
			List<Board> list = mapper.getbestList();
			model.addAttribute("list", list);
		return "index";
	}
}
