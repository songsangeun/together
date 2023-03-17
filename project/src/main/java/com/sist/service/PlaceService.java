package com.sist.service;

import com.sist.mapper.PlaceMapper;
import com.sist.util.Pagination;
import com.sist.vo.BestTipVO;
import com.sist.vo.CommunityReplyVO;
import com.sist.vo.CommunityVO;
import com.sist.vo.PlaceReviewVO;
import com.sist.vo.PlaceVO;
import com.sist.vo.PlacejjimVO;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaceService {

    private static final int BLOCK_SIZE = 5;

    @Autowired
    private PlaceMapper mapper;
    public List<PlaceVO> PlaceListData() {
        return mapper.PlaceListData();
    }

    public PlaceVO placeDetailData(int pno) {
        mapper.PlaceHitIncrement(pno);
        return mapper.placeDetailData(pno);
    }
    public List<PlaceVO> PlaceLisTInfinite(@Param("page") int page) {
        return mapper.PlaceLisTInfinite(page);
    }
    public List<PlaceVO> PlacesSearch(@Param("address") String address, @Param("category") String category, @Param("title") String title) {
        return mapper.PlacesSearch(address, category, title);
    }
    public List<PlaceVO> placeListSort(String sort) {
        return mapper.placeListSort(sort);
    }
    //찜 추가
    public int addJjim(@Param("pno") int pno, @Param("mno") int mno) {
        return mapper.addJjim(pno, mno);
    }

    public Pagination placeBookMark(int mno, String category, int page) {
        int totalCount = mapper.placeLikeCount(mno, category);
        int start = (9 * page) - (9 - 1);
        List<PlacejjimVO> list = mapper.placeLikeList(mno, start - 1, category);
        for (PlacejjimVO placejjimVO : list) {
            String image = placejjimVO.getImage().split(",")[0];
            placejjimVO.setImage(image);
        }
        return new Pagination(list, page, totalCount, BLOCK_SIZE);
    }

    public Pagination reviewList(int mno, String category, int page) {
        int start = (10 * page) - (10 - 1);
        if (category.equals("besttip")) {
            int totalCount = mapper.bestTipReviewLikeCount(mno);
            List<BestTipVO> list = mapper.bestTipList(mno, start - 1);
            return new Pagination(list, page, totalCount, BLOCK_SIZE);
        }
        int totalCount = mapper.commnuityReviewCount(mno);
        List<CommunityReplyVO> list = mapper.communityReviewList(mno, start - 1);
        return new Pagination(list, page, totalCount, BLOCK_SIZE);
    }

    public Pagination writeList(int mno, String category, int page) {
        int start = (10 * page) - (10 - 1);
        if (category.equals("tour")) {
            int totalCount = mapper.placeReviewCount(mno);
            List<PlaceReviewVO> list = mapper.placeReviewList(mno, start - 1);
            return new Pagination(list, page, totalCount, BLOCK_SIZE);
        }
        int totalCount = mapper.communityCount(mno);
        List<CommunityVO> list = mapper.communityList(mno, start - 1);
        return new Pagination(list, page, totalCount, BLOCK_SIZE);
    }


}
