package com.sist.controller;

import com.sist.service.*;
import com.sist.vo.NoticeVO;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping("notice/list.do")
	public String notice_list(String page,Model model) // Model ���� ��ü => request ����
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("start",start); // #{start}
		map.put("end", end);
		List<NoticeVO> list=service.noticeListData(map);
		int totalpage=service.noticeTotalPage();
		model.addAttribute("curpage",curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("list",list); // request.setAttribute("list",list)
		return "notice/list";
	}
	@RequestMapping("notice/insert.do")
	public String notice_insert()
	{
		return "notice/insert";
	}
	@RequestMapping("notice/insert_ok.do")
	public String notice_insert_ok(NoticeVO vo)
	{
		service.noticeInsert(vo);
		return "redirect:list.do";
	}
	@RequestMapping("notice/detail.do")
	public String notice_detail(int nno,Model model)
	{
		NoticeVO vo=service.noticeDetailData(nno);
		model.addAttribute("vo",vo);
		return "notice/detail";
	}
}
