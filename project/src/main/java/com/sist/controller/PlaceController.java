package com.sist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sist.global.security.annotation.LoginMember;
import com.sist.global.security.vo.AuthMemberVO;
import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.sist.service.*;
import com.sist.vo.*;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PlaceController {
    @Autowired
    private PlaceService service;

    @GetMapping("place/place_list.do")
    public String place_list() {
        return "place/place_list";
    }

    @GetMapping("place/place_list_vue.do")
    @ResponseBody
    public List<PlaceVO> place_list_vue() {

        List<PlaceVO> placeList = service.PlaceListData();

        for (PlaceVO vo : placeList) {
            String[] tokens = vo.getTitle().split(" ", 2);
            String title = tokens[0];
            String subtitle = tokens[1];
            vo.setTitle(title);
            vo.setSubtitle(subtitle);
            System.out.println(title);
            System.out.println(subtitle);

            String[] images = vo.getImage().split(",");
            String image = images[0];
            vo.setImage(image);
            System.out.println(image);
        }
        return placeList;
    }

    @GetMapping("place/place_list_infinite.do")
    @ResponseBody
    public List<PlaceVO> place_list_infinite(@RequestParam("page") int page) {

        List<PlaceVO> placeListInfinite = service.PlaceLisTInfinite(page);
        for (PlaceVO vo : placeListInfinite) {
            String[] tokens = vo.getTitle().split(" ", 2);
            String title = tokens[0];
            String subtitle = tokens[1];
            vo.setTitle(title);
            vo.setSubtitle(subtitle);
            System.out.println(title);
            System.out.println(subtitle);

            String[] images = vo.getImage().split(",");
            String image = images[0];
            vo.setImage(image);
            System.out.println(image);
            System.out.println(vo.getPno());
        }
        return placeListInfinite;

    }

    @GetMapping("place/place_detail.do")
    public String place_detail(int pno, Model model) {
        model.addAttribute("pno", pno);
        return "place/place_detail";
    }

    @GetMapping("place/place_detail_vue.do")
    @ResponseBody
    public PlaceVO place_detail_vue(int pno) {
        PlaceVO placeDetailData = service.placeDetailData(pno);

        String[] tokens = placeDetailData.getTitle().split(" ", 2);
        String title = tokens[0];
        String subtitle = tokens[1];
        placeDetailData.setTitle(title);
        placeDetailData.setSubtitle(subtitle);
        System.out.println(title);
        System.out.println(subtitle);

        if (placeDetailData.getOpenHour() == null) {
            placeDetailData.setOpenHour("정보가 없습니다.");
        }
        System.out.println(placeDetailData.getOpenHour());

        return placeDetailData;
    }

    /*@GetMapping("place/place_search.do")
    public String place_search(){
        return "place/place_search";
    }*/
    @GetMapping("place/place_search_vue.do")
    @ResponseBody
    public List<PlaceVO> place_search_vue(@RequestParam("selectedRegion") String selectedRegion, @RequestParam("selectedCity") String selectedCity, @RequestParam("category") String category, @RequestParam("title") String title) {
        String address = selectedRegion + " " + selectedCity;
        System.out.println("입력된 검색 키워드 : " + selectedRegion + " " + selectedCity + " " + category + " " + title);
        List<PlaceVO> PlacesSearch = service.PlacesSearch(address, category, title);


        return PlacesSearch;
    }
    @GetMapping("place/place_list_sort.do")
    @ResponseBody
    public List<PlaceVO> placeListSort(@RequestParam("sort") String sort) {
        System.out.println("sort의 값" + sort);
        List<PlaceVO> placeListSort = service.placeListSort(sort);
        for (PlaceVO vo : placeListSort) {
            String[] tokens = vo.getTitle().split(" ", 2);
            String title = tokens[0];
            String subtitle = tokens[1];
            vo.setTitle(title);
            vo.setSubtitle(subtitle);
            System.out.println(title);
            System.out.println(subtitle);

            String[] images = vo.getImage().split(",");
            String image = images[0];
            vo.setImage(image);
            System.out.println(image);
        }
        return placeListSort;
    }
    @PostMapping("place/place_addJjim.do")
    public int addJjim(@LoginMember Authentication authentication, @Param("pno") int pno) {
        PlacejjimVO principal = (PlacejjimVO) authentication.getPrincipal();
        return service.addJjim(pno, principal.getMno());
    }
}
