package com.sist.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.BestTipVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.service.BestTipService;


@Controller
public class BestTipController {

    @Autowired
    private BestTipService bestTipService;

    @GetMapping("besttip/list")
    public String besttip_list() {
        return "besttip/list";
    }

    @GetMapping("besttip/besttip_before_detail")
    public String besttip_before_detail(int bno, HttpServletResponse response, RedirectAttributes ra) {
        Cookie cookie = new Cookie("pet_best_tip_2_1" + bno, String.valueOf(bno));
        cookie.setPath("/");
        cookie.setMaxAge(60 * 60 * 24);
        response.addCookie(cookie);
        ra.addAttribute("bno", bno);
        return "redirect:../besttip/besttip_detail";
    }

    @GetMapping("/besttip")
    public String besttip_detail(int bno, Model model) {
        BestTipVO bestTipVO = bestTipService.besttipDetailData(bno);
        String[] split = bestTipVO.getContent().split(",");
        model.addAttribute("vo", bestTipVO);
        model.addAttribute("images", split);
        return "besttip/besttip_detail";
    }

}
