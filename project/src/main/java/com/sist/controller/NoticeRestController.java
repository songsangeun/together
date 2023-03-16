package com.sist.controller;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.vo.*;
import com.sist.service.*;
@RestController
public class NoticeRestController {
	@Autowired
	private NoticeService service;
	
	@GetMapping(value="notice/list_vue.do",produces = "text/plain;charset=UTF-8")
	public String notice_list(int page){
	      Map map=new HashMap();
	      map.put("start", (page*10)-9);
	      map.put("end", page*10);
	      List<NoticeVO> list=service.noticeListData(map);
	      int totalpage=service.noticeTotalPage();
	      /*
	       *    [{no:1,...}{no:2...}]
	       */
	      //JSON변환
	      JSONArray arr=new JSONArray();
	      int i=0;
	      for(NoticeVO vo:list)
	      {
	         JSONObject obj=new JSONObject();
	         obj.put("nno", vo.getNno());
	         obj.put("title", vo.getTitle());
	         obj.put("content", vo.getContent());
	         obj.put("dbday", vo.getDbday());
	         obj.put("hit", vo.getHit());
	         if(i==0) //배열마다 curpage,totalpage를 => 배열 맨 첫번째 하나만 추가 => 값을 가져올 경우 0번째에서 값을 가져옴.
	         {
	            obj.put("curpage", page);
	            obj.put("totalpage", totalpage);
	         }
	         
	         arr.add(obj);
	         i++;
	      }
	      return arr.toJSONString();
	   }
	
	@GetMapping("notice/insert_vue.do")
	   public String notice_insert(NoticeVO vo)
	   {
	      service.noticeInsert(vo);
	      return "";
	   }
	
	@GetMapping(value="notice/detail_vue.do",produces = "text/plain;charset=UTF-8")
	   public String notice_detail(int nno)
	   {
	      NoticeVO vo=service.noticeDetailData(nno);
	      JSONObject obj=new JSONObject();
	       obj.put("nno", vo.getNno());
	       obj.put("title", vo.getTitle());
	       obj.put("dbday", vo.getDbday());
	       obj.put("hit", vo.getHit());
	       obj.put("content", vo.getContent());
	       return obj.toJSONString();
	   }
	
}
