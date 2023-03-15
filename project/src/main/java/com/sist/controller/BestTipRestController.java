package com.sist.controller;

import com.sist.global.security.annotation.LoginMember;
import com.sist.global.security.vo.AuthMemberVO;
import com.sist.util.Pagination;

import com.sist.vo.BestTipReplyVO;
import com.sist.vo.BestTipVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.*;

@RestController
public class BestTipRestController {

    @Autowired
    private BestTipService bestTipService;

    @GetMapping("besttip/list_vue")
    public Pagination besttip_list(@RequestParam(value = "page", defaultValue = "1") int page) {
        page = (page <= 0) ? 1 : page;
        return bestTipService.besttipListData(page);
    }

    @GetMapping("/besttip/reply")
    public Pagination bestTipReply(@RequestParam(value = "page", defaultValue = "1") int page,
                                   @RequestParam("bno") int bno) {
        page = (page <= 0) ? 1 : page;
        return bestTipService.bestTipReplyData(page, bno);
    }

    @PostMapping("/besttip/write")
    public void bestTipWrite(@RequestBody BestTipReplyVO bestTipReplyVO, @LoginMember Authentication authentication) {
        AuthMemberVO principal = (AuthMemberVO) authentication.getPrincipal();
        bestTipReplyVO.setMno(principal.getMno());
        bestTipReplyVO.setWriter(principal.getNickname());
        bestTipService.bestTipWrite(bestTipReplyVO);
    }

}
