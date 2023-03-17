package com.sist.mapper;

import java.util.*;

import com.sist.vo.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ReviewMapper {

    @Select("SELECT * FROM pet_place_review_2_1 WHERE pno = #{pno} ORDER BY prno DESC OFFSET ${page} ROW FETCH FIRST 10 ROWS ONLY")
    public List<ReviewVO> reviewListData(@Param("page") int page, @Param("pno") int pno);

    // 총 페이지
    @Select("SELECT COUNT(*) FROM pet_place_review_2_1")
    public int reviewTotalPage();

    @Insert("INSERT INTO pet_place_review_2_1 (prno, pno, content, mno, writer) "
            + "VALUES (PET_PLACE_REVIEW_SEQ.NEXTVAL, #{vo.pno}, #{vo.content}, #{vo.mno}, #{nickname})")
    void reviewInsert(@Param("vo") ReviewVO vo, @Param("nickname") String nickname);
}
	