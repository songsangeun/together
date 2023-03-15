package com.sist.mapper;

import java.util.*;

import com.sist.vo.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import org.springframework.web.bind.annotation.RequestParam;

/*
 *  BNO        NOT NULL NUMBER         
	TITLE      NOT NULL VARCHAR2(300)  
	CONTENT    NOT NULL VARCHAR2(4000) 
	TAG                 VARCHAR2(400)  
	HIT                 NUMBER         
	CREATED_AT          DATE   
 */
@Mapper
public interface BestTipMapper {

    @Select("SELECT * FROM PET_BEST_TIP_2_1 ORDER BY BNO DESC OFFSET ${page} ROW FETCH FIRST 15 ROWS ONLY")
    public List<BestTipVO> bestTipListData(@Param("page") int page);

    @Select("SELECT COUNT(*) FROM PET_BEST_TIP_2_1")
    public int bestTipTotalCount();

    @Select("SELECT TO_CHAR(COUNT(*),'999,999') FROM pet_best_2_1")
    public String besttipRowCount();

    @Select("SELECT bno,title,content,tag,TO_CHAR(created_at,'YYYY-MM-DD') as createdAt "
            + "FROM pet_best_tip_2_1 "
            + "WHERE bno=#{bno}")
    public BestTipVO besttipDetailData(int bno);

    @Select("SELECT COUNT(*) FROM PET_BEST_TIP_REPLY_2_1 WHERE bno = #{bno}")
    int bestTipReviewTotalCount(@Param("bno") int bno);

    @Select("SELECT * FROM PET_BEST_TIP_REPLY_2_1 WHERE bno = #{bno} ORDER BY BRNO DESC OFFSET ${page} ROW FETCH FIRST 5 ROWS ONLY")
    List<BestTipReplyVO> bestTipReplyData(@Param("bno") int bno, @Param("page") int page);

    @Insert("INSERT INTO PET_BEST_TIP_REPLY_2_1 (brno, bno, mno, content, writer) VALUES (PET_BEST_TIP_REPLY_2_.NEXTVAL, #{vo.bno}, #{vo.mno}, #{vo.content}, #{vo.writer})")
    void bestTipWrite(@Param("vo") BestTipReplyVO vo);

}
