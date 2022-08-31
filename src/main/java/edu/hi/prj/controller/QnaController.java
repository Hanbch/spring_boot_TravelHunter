package edu.hi.prj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.hi.prj.service.BoardService;
import edu.hi.prj.service.ReplyService;
import edu.hi.prj.vo.BoardVO;
import edu.hi.prj.vo.Criteria;
import edu.hi.prj.vo.PagingVO;
import edu.hi.prj.vo.ReplyVO;
import edu.hi.prj.vo.SearchCriteria;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/qna")
@Controller
public class QnaController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private ReplyService reply_service;
	
	@GetMapping("")
	public String Qna(Model model, @ModelAttribute("scri")SearchCriteria scri, Criteria cri) {
		model.addAttribute("boardList2", service.getList(2));
		model.addAttribute("boardList", service.pagingList(scri));
		
		model.addAttribute("boardList", service.pagingList(scri));
		
		
		PagingVO pagingVO = new PagingVO();
		pagingVO.setCri(scri);
		pagingVO.setTotalCount(service.getTotalCount(scri));
		
		model.addAttribute("pageMaker", pagingVO);
		return "/qna/qna";
	}
	


	
	@GetMapping("/write")
	public String write() {
		
		
		return "/qna/write";
	}
		
	@PostMapping("/complete")
	public String complete(BoardVO boardVO) {
		
		service.write(boardVO);
		
		return "redirect:/qna";
	}
	
	@GetMapping("/search")
	public String search(Model model,BoardVO boardVO) {
		
		String member_id = boardVO.getMember_id();
		model.addAttribute("boardList",service.searchList(member_id));
		
		return "/qna/qna";
	}
	
	@GetMapping("/detail")
	public String detail(Model model,BoardVO boardVO, ReplyVO replyVO) {
		int id = boardVO.getId();
		
		model.addAttribute("data",service.getBoard(id));
		model.addAttribute("qnareply", reply_service.qnagetReply(id));
		
		
		service.updateView(boardVO.getId());
		
		//댓글
		model.addAttribute("reply", reply_service.getList(id));
		
		return "/qna/detail";
	}
	
	@GetMapping("/edit")
	public String edit(Model model, BoardVO boardVO) {
		
		int id = boardVO.getId();
		model.addAttribute("data", service.getBoard(id));
		
		return "/qna/edit";
	}
	
	@PostMapping("/update")
	public String update(BoardVO boardVO) {
		
		service.update(boardVO);
		
		return "redirect:/qna;";
	}
	
	@PostMapping("/delete")
	public String delete(BoardVO boardVO) {
		
		service.delete(boardVO);
		return "redirect:/qna;";
	}
	
	@PostMapping("/reply")
	public String qnareply(ReplyVO replyVO, Authentication authentication) {
		String member_id = authentication.getName();
		replyVO.setMember_id(member_id);
		reply_service.write(replyVO);
		return "redirect:";
	}

	
	
	
}
