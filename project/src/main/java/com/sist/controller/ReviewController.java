package com.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	@GetMapping("review/review_list")
	public String review_list()
	{
		return "review/review_list";
	}
	
	@GetMapping("review/insert")
	public String review_insert()
	{
		return "review/insert";
	}
	
	@GetMapping("review/detail")
	public String review_detail(int prno,Model model)
	{
		model.addAttribute("prno", prno);
		return "review/detail";
	}
	
	@GetMapping("review/update")
	public String review_update(int prno,Model model)
	{
		model.addAttribute("prno", prno);
		return "review/update";
	}
	
	@GetMapping("review/delete")
	public String review_delete(int prno,Model model)
	{
		model.addAttribute("prno", prno);
		return "review/delete";
	}
}
