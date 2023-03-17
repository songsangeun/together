package com.sist.controller;

import com.sist.global.security.annotation.LoginMember;
import com.sist.util.Pagination;
import com.sist.vo.*;
import com.sist.global.security.vo.AuthMemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.service.ReviewService;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReviewRestController {

    @Autowired
    private ReviewService service;

    @GetMapping("/review/review_list_vue")
    public Pagination test(@RequestParam(value = "page", defaultValue = "1") int page,
                           @RequestParam("pno") int pno) {
        page = (page <= 0) ? 1 : page;
        return service.reviewListData(page, pno);
    }

    @PostMapping("/review/review_insert_vue")
    public void review_insert(@RequestBody ReviewVO reviewVO, @LoginMember Authentication auth) {
        AuthMemberVO principal = (AuthMemberVO) auth.getPrincipal();
        String nickname = principal.getNickname();
        int mno = principal.getMno();
        reviewVO.setWriter(nickname);
        reviewVO.setMno(mno);
        service.reviewInsert(reviewVO, nickname);
    }

}


























