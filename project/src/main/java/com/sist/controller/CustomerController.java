package com.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	/*@Autowired
	private CustomerService service;*/

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

    @GetMapping("/detail")
    public String cs_detail(int nno, Model model) {
        model.addAttribute("nno", nno); // model을 이용해서 nno값 넘기기
        return "customer/detail";
    }

    @GetMapping("/update")
    public String cs_update(int nno, Model model) {
        model.addAttribute("nno", nno);
        return "customer/update";
    }

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