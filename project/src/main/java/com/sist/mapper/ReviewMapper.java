package com.sist.mapper;
import java.util.*;
import com.sist.vo.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
/*
 *  PRNO          NUMBER         
	PNO           NUMBER         
	MNO           NUMBER         
	CONTENT       VARCHAR2(4000) 
	CREATED_AT    DATE      
 */
import org.apache.ibatis.annotations.Update;
@Mapper
public interface ReviewMapper {
@Select("SELECT prno,pno,mno,content,TO_CHAR(regdate,'YYYY-MM-DD') as created_at,writer num "
		+"FROM (SELECT prno,pno,mno,content,created_at,write,rownum as num "
		+"FROM pet_place_review_2_1) "
		+"WHERE num BETWEEN #{start} AND #{end}")
		public List<ReviewVO> reviewListData(Map map);

// 총 페이지
@Select("SELECT CEIL(COUNT(*)/10.0) FROM pet_place_review_2_1")
public int reviewTotalPage();

// 글쓰기
@SelectKey(keyProperty="no",resultType=int.class,before=true,
			statement="SELECT NVL(MAX(no)+1,1) as no FROM pet_place_review_2_1")
@Insert("INSERT INTO pet_place_review_2_1 VALUES("
		+"#{writer},#{prno},#{pno},#{mno},#{content},SYSDATE,0")
public void reviewInsert(ReviewVO vo);

// 상세
@Select("SELECT prno,pno,mno,content,TO_CHAR(created_at,'YYYY-MM-DD') as createdAt "
		+"FROM pet_place_review_2_1 "
		+"WHERE prno=#{prno}")
public ReviewVO reviewDetailData(int pno);

// 삭제
@Delete("DELETE FROM pet_place_review_2_1 "
		+"WHERE prno=#{prno}")
public void reviewDelete(int prno);

// 수정
@Update("UPDATE pet_place_review_2_1 SET "
		+"mno=#{mno},content=#{content} "
		+"WHERE prno=#{prno}")
public void reviewUpdate(ReviewVO vo);
}
	