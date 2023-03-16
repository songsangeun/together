package com.sist.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

import com.sist.vo.CustomerReplyVO;
import com.sist.vo.CustomerVO;
import com.sist.global.security.annotation.LoginMember;
import com.sist.global.security.vo.AuthMemberVO;
import com.sist.service.CustomerService;
import com.sist.util.Pagination;

@RestController
@RequestMapping("/customer")
public class CustomerRestController {

    @Autowired
    private CustomerService service;

    // VusJS에서 페이지 전송
    @GetMapping("/list_vue.do")
    //public String cs_list(int page) {
        /*Map map = new HashMap();
        map.put("start", (page * 10) - 9);
        map.put("end", page * 10);

        List<CustomerVO> cslist = service.csBoardListData(map);
        int totalpage = service.csBoardTotalPage();

        // json변환
        JSONArray arr = new JSONArray();
        int i = 0;
        for (CustomerVO vo : cslist) {
            JSONObject obj = new JSONObject();
            obj.put("nno", vo.getNno());
            obj.put("subject", vo.getSubject());
            obj.put("name", vo.getName());
            obj.put("dbday", vo.getDbday());
            obj.put("hit", vo.getHit());

            if (i == 0) {
                obj.put("curpage", page);
                obj.put("totalpage", totalpage);
            }
            arr.add(obj);
            i++;
        }*/
        //return arr.toJSONString();
    	public Pagination test(@RequestParam(value="page", defaultValue = "1") int page)
    	{
    		page = (page <= 0) ? 1 :page;
    		return service.csBoardListData(page);
    	}

    // 사용자 값 가져오기
    @PostMapping("/insert_vue.do")
    public String cs_insert(@RequestBody CustomerVO vo, Authentication auth) {
    	AuthMemberVO principal = (AuthMemberVO)auth.getPrincipal();
    	String nickname = principal.getNickname();
    	int mno = principal.getMno();
        service.csBoardInsert(vo, mno, nickname);
        System.out.println("ss");
        return "ok";
    }

    @GetMapping("/detail_vue.do")
    public String cs_detail(int nno) {
        CustomerVO vo = service.csBoardDetailData(nno);

        JSONObject obj = new JSONObject();
        obj.put("nno", vo.getNno());
        obj.put("subject", vo.getSubject());
        obj.put("name", vo.getName());
        obj.put("dbday", vo.getDbday());
        obj.put("hit", vo.getHit());
        obj.put("content", vo.getContent());

        return obj.toJSONString();
    }

    @GetMapping("/update_vue.do")
    public CustomerVO cs_update(int nno) {
        return service.csBoardDetailData(nno);
    }

    @GetMapping("/update_ok_vue.do")
    public String cs_update_ok(CustomerVO vo) {
        return service.csBoardUpdate(vo);
    }

    @GetMapping("/delete_vue.do")
    public String cs_delete_ok(int nno, String pwd)
    {
        return service.csBoardDelete(nno, pwd);
    }

    @PostMapping("/write")
    public void cs_write(@RequestBody CustomerReplyVO customerReplyVO, @LoginMember Authentication authentication)
    {
    	AuthMemberVO principal=(AuthMemberVO)authentication.getPrincipal();
    	// hrno는 시퀀스로 가져옴
    	// nno는 고객센터 글에서 보내주고 
    	service.csReplySave(customerReplyVO);
    }
    
    @GetMapping("/reply")
    public CustomerReplyVO cs_reply(@RequestParam("nno") int nno)
    {
    	return service.csReplyData(nno);
    }

}