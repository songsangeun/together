package com.sist.service;
import com.sist.mapper.*;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
@Repository
public class NoticeService {
	@Autowired
	private NoticeMapper mapper;
	
	/*
	 * @Select("SELECT nno,title,content,TO_CHAR(created_at,'YYYY-MM-DD') as dbday,hit,num "
	 * +"FROM (SELECT nno,title,content,created_at,hit,rownum as num "
	 * +"FROM (SELECT nno,title,content,created_at,hit "
	 * +"FROM pet_notice_2_1 ORDER BY nno DESC)) "
	 * +"WHERE num BETWEEN #{start} AND #{end}")
	 */
	public List<NoticeVO> noticeListData(Map map)
	{
		return mapper.noticeListData(map);
	}
	
	//@Select("SELECT CEIL(COUNT(*)/10.0) FROM pet_notice_2_1")
	public int noticeTotalPage()
	{
		return mapper.noticeTotalPage();
	}
	
	/*
	 * @SelectKey(keyProperty = "nno",resultType = int.class,before = true,
	 * statement = "SELECT NVL(MAX(nno)+1,1) as nno FROM pet_notice_2_1")
	 * 
	 * @Insert("INSERT INTO pet_notice_2_1 VALUES("
	 * +"#{nno},#{title},#{content},SYSDATE,0)")
	 */
	public void noticeInsert(NoticeVO vo)
	{
		mapper.noticeInsert(vo);
	}
	
	/*
	 * @Update("UPDATE pet_notice_2_1 SET " +"hit=hit+1 " +"WHERE nno=#{nno}")
	 * public void noticeHitIncrement(int nno);
	 */
	
	/*
	 * @Select("SELECT nno,title,content,TO_CHAR(created_at,'YYYY-MM-DD') as dbday,hit "
	 * +"FROM pet_notice_2_1 " +"WHERE nno=#{nno}")
	 */
	public NoticeVO noticeDetailData(int nno)
	{
		mapper.noticeHitIncrement(nno);
		return mapper.noticeDetailData(nno);
	}

	public void noticeDelete(int nno)
  	{
  		mapper.noticeDelete(nno);
  	}

}
