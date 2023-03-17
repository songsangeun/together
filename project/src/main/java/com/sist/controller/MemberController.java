package com.sist.controller;

import com.sist.global.security.annotation.LoginMember;
import com.sist.global.security.vo.AuthMemberVO;
import com.sist.service.MemberService;
import com.sist.service.PlaceService;
import com.sist.util.Pagination;
import com.sist.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private PlaceService placeService;

    @GetMapping("/login")
    public String loginPage() {
        return "member/login";
    }

    @GetMapping("/signup")
    public String signupPage() {
        return "member/signup";
    }

    @GetMapping("/mypage")
    public String myPage(@RequestParam(value = "type", defaultValue = "bookmark") String type,
                         @LoginMember Authentication authentication, Model model) {
        AuthMemberVO principal = (AuthMemberVO) authentication.getPrincipal();
        MemberVO vo = memberService.profile(principal.getUsername());
        model.addAttribute("member", vo);
        if (type.equals("write")) {
            return "member/mypage-write";
        } else if (type.equals("comment")) {
            return "member/mypage-comment";
        }
        return "member/mypage-bookmark";
    }

    @GetMapping("/mypage/out")
    public String myPageInfo(@LoginMember Authentication authentication, Model model) {
        AuthMemberVO principal = (AuthMemberVO) authentication.getPrincipal();
        MemberVO vo = memberService.profile(principal.getUsername());
        model.addAttribute("member", vo);
        return "member/mypage-out";
    }

    @PostMapping("/signup")
    @ResponseBody
    public void signup(@RequestBody MemberVO memberVO) {
        memberService.signup(memberVO);
    }

    @GetMapping("/nickname/duplicate-check")
    @ResponseBody
    public String nicknameDuplicateCheck(@RequestParam("nickname") String nickname) {
        memberService.nicknameDuplicateCheck(nickname);
        return "사용 가능한 닉네임입니다.";
    }

    @GetMapping("/email/duplicate-check")
    @ResponseBody
    public String emailDuplicateCheck(@RequestParam("email") String email) {
        memberService.emailDuplicateCheck(email);
        return "사용 가능한 이메일입니다.";
    }

    @GetMapping("/mypage/bookmark")
    @ResponseBody
    public Pagination bookMarkList(@LoginMember Authentication authentication,
                                   @RequestParam("cate") String category,
                                   @RequestParam(value = "page", defaultValue = "1") int page) {
        page = (page <= 0) ? 1 : page;
        AuthMemberVO principal = (AuthMemberVO) authentication.getPrincipal();
        switch (category) {
            case "all":
                category = "'관광지', '음식점', '숙소', '캠핑', '쇼핑', '호텔링'";
                break;
            case "tour":
                category = "'관광지'";
                break;
            case "food":
                category = "'음식점'";
                break;
            case "house":
                category = "'숙소'";
                break;
            case "camp":
                category = "'캠핑'";
                break;
            case "shop":
                category = "'쇼핑'";
                break;
            default:
                category = "'호텔링'";
                break;
        }
        return placeService.placeBookMark(principal.getMno(), category, page);
    }

    @GetMapping("/mypage/review")
    @ResponseBody
    public Pagination reviewList(@LoginMember Authentication authentication,
                                 @RequestParam("cate") String category,
                                 @RequestParam(value = "page", defaultValue = "1") int page) {
        page = (page <= 0) ? 1 : page;
        AuthMemberVO principal = (AuthMemberVO) authentication.getPrincipal();
        return placeService.reviewList(principal.getMno(), category, page);
    }

    @GetMapping("/mypage/write")
    @ResponseBody
    public Pagination writeList(@LoginMember Authentication authentication,
                                @RequestParam("cate") String category,
                                @RequestParam(value = "page", defaultValue = "1") int page) {
        page = (page <= 0) ? 1 : page;
        AuthMemberVO principal = (AuthMemberVO) authentication.getPrincipal();
        return placeService.writeList(principal.getMno(), category, page);
    }

    @PostMapping("/out")
    @ResponseBody
    public void memberOut(@LoginMember Authentication authentication) {
        AuthMemberVO principal = (AuthMemberVO) authentication.getPrincipal();
        memberService.memberOut(principal.getMno());
    }

}
