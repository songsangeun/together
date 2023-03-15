package com.sist.service;

import java.util.List;

import com.sist.util.Pagination;
import com.sist.vo.BestTipReplyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.mapper.BestTipMapper;
import com.sist.vo.BestTipVO;

@Service
public class BestTipService {

    @Autowired
    private BestTipMapper bestTipMapper;

    public Pagination besttipListData(int page) {
        int start = (20 * page) - (20 - 1);
        List<BestTipVO> list = bestTipMapper.bestTipListData(start - 1);
        for (BestTipVO bestTipVO : list) {
            String content = bestTipVO.getContent().split(",")[0];
            bestTipVO.setContent(content);
        }
        int totalCount = bestTipMapper.bestTipTotalCount();
        return new Pagination(list, page, totalCount, 7);
    }

    public Pagination bestTipReplyData(int page, int bno) {
        int start = (10 * page) - (10 - 1);
        List<BestTipReplyVO> list = bestTipMapper.bestTipReplyData(bno, start - 1);
        int totalCount = bestTipMapper.bestTipReviewTotalCount(bno);
        return new Pagination(list, page, totalCount, 7);
    }

    public BestTipVO besttipDetailData(int bno) {
        BestTipVO bestTipVO = bestTipMapper.besttipDetailData(bno);
        String tag = bestTipVO.getTag().replace(",", "  ");
        bestTipVO.setTag(tag);
        return bestTipVO;
    }

    public void bestTipWrite(BestTipReplyVO vo) {
        bestTipMapper.bestTipWrite(vo);
    }

}
