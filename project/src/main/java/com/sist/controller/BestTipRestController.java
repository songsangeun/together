package com.sist.controller;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.vo.*;
import com.sist.service.*;

@RestController
public class BestTipRestController {
	@Autowired
	private BestTipService service;
	
	// Cookie 전송
	/*@GetMapping("besttip/cookie_data")
	   public String food_cookie_data(HttpServletRequest request)
	   {
		   // new Cookie(key,value)
		   //           ---- ------
		   //          getNam() getValue()
		   Cookie[] cookies=request.getCookies();
		   List<BestTipVO> list=new ArrayList<BestTipVO>();
		   if(cookies!=null)
		   {
			   for(int i=cookies.length-1;i>=0;i--)
			   {
				   if(cookies[i].getName().startsWith("spring_food"))
				   {
					   String fno=cookies[i].getValue();
					   BestTipVO vo=service.besttipCookieDetailData(Integer.parseInt(bno));
					   list.add(vo);
				   }
			   }
		   }*/
	
	
	@GetMapping("besttip/list_vue")
	public String besttip_list(String page)
	{
		if(page==null)
			page="1";
		 int curpage=Integer.parseInt(page);
		   Map map=new HashMap();
		   map.put("start", (curpage*20)-19);
		   map.put("end",(curpage*20));		
		   List<BestTipVO> list=service.besttipListData(map);

		   int totalpage=service.besttipTotalPage();
		   
		   final int BLOCK=7;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   if(endPage>totalpage)
			   endPage=totalpage;
		
		// JSON 변환
			JSONArray arr=new JSONArray();
			int i=0;
		for(BestTipVO vo:list)
		{
			JSONObject obj=new JSONObject();
			obj.put("bno", vo.getBno());
			obj.put("title", vo.getTitle());
			obj.put("content", vo.getContent());
			obj.put("tag", vo.getTag());
			obj.put("hit", vo.getHit());
			obj.put("createdAt", vo.getCreatedAt());
			String content=vo.getContent();
			String[] images=content.split(",");
			obj.put("thumbnail", images[0]);
			if(i==0)
			   {
				   obj.put("curpage", curpage);
				   obj.put("totalpage", totalpage);
				   obj.put("startPage",startPage);
				   obj.put("endPage", endPage);
			   }
			   
			   arr.add(obj);
			   i++;
			   
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	// detail_vue
	@GetMapping("besttip/besttip_detail_vue")
	public String besttip_detail_vue(int bno)
	{
		List<BestTipVO> list=service.besttipDetailData(bno);
		JSONArray arr=new JSONArray();
		for(BestTipVO vo:list)
		{
			JSONObject obj=new JSONObject();
			obj.put("bno", vo.getBno());
			obj.put("title", vo.getTitle());
			obj.put("content", vo.getContent());
			obj.put("tag", vo.getTag());
			obj.put("hit", vo.getHit());
			obj.put("createdAt", vo.getCreatedAt());
			arr.add(obj);
		}
		
		
		return arr.toJSONString();
	}
	
}






























