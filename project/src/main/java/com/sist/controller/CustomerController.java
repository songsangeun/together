package com.sist.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.service.CustomerService;
import com.sist.vo.CustomerVO;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService service;
    // 사용자 요청 받기 => URI를 통해 사용자 요청을 받음
    @GetMapping("/list")
    // 사용자에게 받은 주소가 customer/list 라면 어떤 역할을 수행할거니?
    public String cs_list() {
        return "customer/list";
    }

    @GetMapping("/insert")
    public String cs_insert() {
        return "customer/insert";
    }

    @PostMapping("/insert_ok.do")
	   public String cs_insert_ok(CustomerVO vo)
	   {
		   
		   List<MultipartFile> list=vo.getFiles();
		   if(list==null)//업로드가 안된 상태
		   {
			   vo.setFilename("");
			   vo.setFilesize("");
		   }
		   else// 업로드가 된 상태 a.jpg,b.jpg,c.jpg
		   {
			   String fn="";
			   String fs="";
			   for(MultipartFile mf:list)
			   {
				   String of=mf.getOriginalFilename();
				   fn+=of+","; // 데이터베이스 첨부
				   File file=new File("c:\\download\\"+of);//업로드
				   fs+=mf.getSize()+",";
				   try
				   {
				      mf.transferTo(file);
				   }catch(Exception ex) {}
			   }
			   vo.setFilename(fn.substring(0,fn.lastIndexOf(",")));
			   vo.setFilesize(fs.substring(0,fs.lastIndexOf(",")));
		   }
		   service.csFileInsert(vo);
		   return "redirect:list.do";//sendRedirect => request를 초기화 => 화면 이동 
	   }
    
    
    @GetMapping("/detail")
    public String cs_detail(int nno, Model model) {
    	CustomerVO vo=service.csBoardDetailData(nno);
        model.addAttribute("vo", vo); // model을 이용해서 nno값 넘기기
        model.addAttribute("nno", nno);
        return "customer/detail";
    }

	
	  @GetMapping("/update") public String cs_update(int nno, Model model) {
	  model.addAttribute("nno", nno); CustomerVO vo=service.csBoardDetailData(nno);
	  service.csBoardDetailData(nno); model.addAttribute("vo", vo); return
	  "customer/update"; }
	

    @GetMapping("/delete")
    public String cs_delete(int nno, Model model) {
        model.addAttribute("nno", nno);
        return "customer/delete";
    }

    @GetMapping("/faq")
    public String faq() {
        return "customer/faq";
    }

}