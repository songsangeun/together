package com.sist.service;

import java.util.*;

import com.sist.util.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.mapper.ReviewMapper;
import com.sist.vo.ReviewVO;

@Service
public class ReviewService {

    @Autowired
    private ReviewMapper mapper;

    public Pagination reviewListData(int page, int pno) {
        int start = (10 * page) - (10 - 1);
        List<ReviewVO> items = mapper.reviewListData(start - 1, pno);
        int totalCount = mapper.reviewTotalPage();
        return new Pagination(items, page, totalCount, 7);
    }

    public void reviewInsert(ReviewVO reviewVO, String nickname) {
        mapper.reviewInsert(reviewVO, nickname);
    }

}
