package com.sist.mapper;
import java.util.*;
import com.sist.service.*;
import com.sist.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
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
	@Select("SELECT bno,title,content,tag,TO_CHAR(created_at,'YYYY-MM-DD') as createdAt,hit,num "
			+"FROM (SELECT bno,title,content,created_at,tag,hit,rownum as num "
			+"FROM (SELECT bno,title,content,created_at,tag,hit "
			+"FROM pet_best_tip_2_1) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<BestTipVO> besttipListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM pet_best_tip_2_1")
	public int besttipTotalPage();
	
	@Select("SELECT TO_CHAR(COUNT(*),'999,999') FROM pet_best_2_1")
	public String besttipRowCount();
	
	@Select("SELECT bno,title,content,tag,TO_CHAR(created_at,'YYYY-MM-DD') as createdAt "
			+"FROM pet_best_tip_2_1 "
			+"WHERE bno=#{bno}")
	public List<BestTipVO> besttipDetailData(int bno);
	
}
