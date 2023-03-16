package com.sist.controller;

import com.sist.service.*;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@GetMapping("notice/list.do")
	   public String notice_list()
	   {
		   return "notice/list";
	   }
	   @GetMapping("notice/insert.do")
	   public String notice_insert()
	   {
		   return "notice/insert";
	   }
	   @GetMapping("notice/detail.do")
	   public String notice_detail(int nno,Model model)
	   {
		   model.addAttribute("nno", nno);
		   return "notice/detail";
	   }
	  
	   @GetMapping("notice/delete.do")
	   public String notice_delete_ok(int nno)
	   {
		  service.noticeDelete(nno);
		  return "redirect:../notice/list.do";
	   }
	}