package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.mapper.BestTipMapper;
import com.sist.vo.BestTipVO;

@Service
public class BestTipService {
	@Autowired
	private BestTipMapper mapper;
	
	/* @Select("SELECT bno,title,content,tag,hit,created_at,num "
			+"FROM (SELECT bno,title,content,tag,hit,created_at,rownum as num "
			+"FROM pet_best_tip_2_1) "
			+"WHERE num BETWEEN #{start} AND #{end}") */
	public List<BestTipVO> besttipListData(Map map)
	{
		return mapper.besttipListData(map);
	}
	
	//@Select("SELECT CEIL(COUNT(*)/20.0) FROM pet_best_tip_2_1")
	public int besttipTotalPage()
	{
		return mapper.besttipTotalPage();
	}
	
	//@Select("SELECT TO_CHAR(COUNT(*),'999,999') FROM pet_best_2_1")
	public String besttipRowCount()
	{
		return mapper.besttipRowCount();
	}
	
	/* @Select("SELECT bno,title,content,TO_CHAR(regdate,'YYYY-MM-DD') as created_at "
			+"FROM pet_best_tip_2_1 "
			+"WHERE bno=#{bno}") */
	public List<BestTipVO> besttipDetailData(int bno)
	{
		return mapper.besttipDetailData(bno);
	}
	
}
