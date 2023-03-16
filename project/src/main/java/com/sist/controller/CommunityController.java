package com.sist.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.service.CommunityService;
import com.sist.vo.CommunityVO;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService service;
	
	@GetMapping("community/list.do")
	public String community_list()
	{
		return "community/list";
	}
	
	@GetMapping("community/insert.do")
	public String community_insert()
	{
		return "community/insert";
	}
	
	@PostMapping("community/insert_ok.do")
	   public String databoard_insert_ok(CommunityVO vo)
	   {
		   MultipartFile list=vo.getFiles();
		   if(list==null)//업로드가 안된 상태
		   {
			   vo.setFilename("default.jpg"); 
			   vo.setFilesize(0);
		   }
		   else// 업로드가 된 상태 a.jpg,b.jpg,c.jpg
		   {
			   String path="C:\\Users\\user\\OneDrive\\바탕 화면\\project2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\static\\image\\upload\\";
			   File file=new File(path+list.getOriginalFilename());//업로드
				   try
				   {
				      list.transferTo(file);
				   }catch(Exception ex) {ex.printStackTrace();}
			   
			   vo.setFilename(file.getName());
			   vo.setFilesize((int)file.length());
		   }
		   service.communityInsert(vo);
		   return "redirect:list.do";//sendRedirect => request를 초기화 => 화면 이동 
	   }
	
	@GetMapping("community/detail.do")
	public String community_detail(int cno,Model model)
	{
		model.addAttribute("cno",cno);
		return "community/detail";
	}
	
	@GetMapping("community/update.do")
	public String community_update(int cno,Model model)
	{
		model.addAttribute("cno",cno);
		return "community/update";
	}
	
	@GetMapping("community/delete.do")
	public String community_delete(int cno,Model model)
	{
		model.addAttribute("cno",cno);
		return "community/delete";
	}
}
