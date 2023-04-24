package kr.board.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.board.entity.Board;
import kr.board.entity.TblBoard;
import kr.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;

	@RequestMapping("/tboard.do")
	public String getList(TblBoard vo, Model model, String keyWord, String searchType) {
		vo.setKeyword(keyWord);
		vo.setSearchType(searchType);
		List<TblBoard> list = boardService.getList(vo);
		model.addAttribute("list",list);
		return "board/list";
	}
	
	@GetMapping("/register.do")
	public String register() {
		return "board/register";
	}
	
	@PostMapping("/register.do")
	public String register(TblBoard vo, RedirectAttributes rttr) {
		boardService.register(vo);
		rttr.addFlashAttribute("result", vo.getIdx());
		return "redirect:/tboard.do";
	}
	
	@RequestMapping(value = "/view.do", method= {RequestMethod.GET})
	public String get(@RequestParam("idx") Integer idx, Model model) {
	    TblBoard vo = boardService.get(idx);
	    boardService.count(idx);
	    model.addAttribute("vo", vo);
	    return "board/view";
	}
	@GetMapping("/modify.do")
	public String modify(@RequestParam Integer idx, Model model) {
		 TblBoard vo = boardService.get(idx);
		 model.addAttribute("vo", vo);
		 return "board/modify";
	}
	
	@PostMapping("/modify.do")
	public String modify(TblBoard vo) {
		boardService.modify(vo);
		return "redirect:/tboard.do";
	}
	@GetMapping("/remove")
	public String remove(@RequestParam int idx) {
		boardService.remove(idx);
		return "redirect:/tboard.do";
	}

	
	
	
}