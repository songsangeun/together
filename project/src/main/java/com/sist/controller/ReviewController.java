package com.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	@GetMapping("/review/review_list")
	public String review_list()
	{
		return "review/review_list";
	}
	
	@GetMapping("/review/review_insert")
	public String review_insert()
	{
		return "review/review_insert";
	}
	
	@GetMapping("/review/review_detail")
	public String review_detail(int prno,Model model)
	{
		model.addAttribute("prno", prno);
		return "review/review_detail";
	}
	
	@GetMapping("/review/review_update")
	public String review_update(int prno,Model model)
	{
		model.addAttribute("prno", prno);
		return "review/review_update";
	}
	
	@GetMapping("/review/review_delete")
	public String review_delete(int prno,Model model)
	{
		model.addAttribute("prno", prno);
		return "review/review_delete";
	}
}
