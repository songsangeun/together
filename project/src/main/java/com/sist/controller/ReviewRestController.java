package com.sist.controller;
import com.sist.vo.*;
import com.sist.global.security.vo.AuthMemberVO;
import com.sist.service.*;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.service.ReviewService;

@Controller
public class ReviewRestController {
	@Autowired
	private ReviewService service;
	
	// 목록
	@GetMapping("/review/review_list_vue")
//	public String review_list(int page)
//	{
//		Map map=new HashMap();
//		map.put("start", (page*10)-9);
//		map.put("end", page*10);
//		List<ReviewVO> list=service.reviewListData(map);
//		int totalpage=service.reviewTotalPage();
//		
//		JSONArray arr=new JSONArray();
//		   int i=0;
//		   for(ReviewVO vo:list)
//		   {
//			   JSONObject obj=new JSONObject();
//			   obj.put("prno", vo.getPrno());
//			   obj.put("pno", vo.getPno());
//			   obj.put("mno", vo.getMno());
//			   obj.put("content", vo.getContent());
//			   obj.put("createdAt", vo.getCreatedAt());
//			   obj.put("writer", vo.getWriter());
//			   if(i==0)
//			   {
//				   obj.put("curpage", page);
//				   obj.put("totalpage", totalpage);
//			   }
//			   
//			   arr.add(obj);
//			   i++;
//		   }
//		   return arr.toJSONString();
//	}
	public List<ReviewVO> test(@RequestParam(value="page",defaultValue="1") int page)
	{
		page=(page<=0)?1:page;
		return service.reviewListData(page);
	}

	// 상세
	@GetMapping("review/review_detail_vue")
	public String review_detail(int prno)
	{
		   ReviewVO vo=service.reviewDetailData(prno);
		   JSONObject obj=new JSONObject();
		   obj.put("prno", vo.getPrno());
		   obj.put("pno", vo.getPno());
		   obj.put("mno", vo.getMno());
		   obj.put("content", vo.getContent());
		   obj.put("createdAt", vo.getCreatedAt());
		   return obj.toJSONString();
	}
	
	// 글쓰기
//	@GetMapping("review/review_insert_vue")
//	public String review_insert(ReviewVO vo)
//	{
//		service.reviewInsert(vo);
//		return"";
//	}
	@PostMapping("/review/review_insert_vue")
	public String review_insert(@RequestBody ReviewVO vo, Authentication auth) {
		AuthMemberVO principal=(AuthMemberVO)auth.getPrincipal();
		String nickname=principal.getNickname();
		int mno=principal.getMno();
		service.reviewInsert(vo,mno,nickname);
		return "";
	}
	
	// 수정
	@GetMapping("review/review_update_vue")
	public String review_update(int prno)
	{
		   ReviewVO vo=service.reviewDetailData(prno);
		   JSONObject obj=new JSONObject();
		   obj.put("prno", vo.getPrno());
		   obj.put("pno", vo.getPno());
		   obj.put("mno", vo.getMno());
		   obj.put("content", vo.getContent());
		   obj.put("createdAt", vo.getCreatedAt());
		   return obj.toJSONString();
	}
	
	/*
	 * // 수정 완료
	 * 
	 * @GetMapping("board/update_ok_vue") public String board_update_ok(ReviewVO vo)
	 * { String res=service.boardUpdate(vo); return res; }
	 */
	
	/*
	 * // 삭제
	 * 
	 * @GetMapping("review/delete_vue") public String review_delete_ok(int prno) {
	 * return ""; }
	 */
}


























