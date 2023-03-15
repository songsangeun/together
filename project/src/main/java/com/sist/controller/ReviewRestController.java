package com.sist.controller;
import com.sist.vo.*;
import com.sist.service.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.service.ReviewService;

@Controller
public class ReviewRestController {
	@Autowired
	private ReviewService service;
	
	// 목록
	@GetMapping("review/review_list_vue.do")
	public String review_list(int page)
	{
		Map map=new HashMap();
		map.put("start", (page*20)-19);
		map.put("end", page*20);
		List<ReviewVO> list=service.reviewListData(map);
		int totalpage=service.reviewTotalPage();
		return "";
	}
	
	// 상세
	@GetMapping("review/detail_vue.do")
	public String review_detail(int prno)
	{
		return "";
	}
	
	// 글쓰기
	@GetMapping("review/insert_vue")
	public String review_insert(ReviewVO vo)
	{
		service.reviewInsert(vo);
		return"";
	}
	
	// 수정
	@GetMapping("review/update_ok_vue")
	public String review_update(int prno)
	{
		return "";
	}
	
	// 삭제
	@GetMapping("review/delete_vue")
	public String review_delete_ok(int prno)
	{
		return "";
	}
}


























