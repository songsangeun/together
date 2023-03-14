package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

/*
    private int cno;
    
    private int hit;

    private String title;

    private String content;
    
    private int filesize;
    
    private String filename;

    private String type;
    
    private String dbday;

    private Date createdAt;

    
    private int mno;
 */
public interface CommunityMapper {
	
	@Select("SELECT cno,hit,name,title,filesize,type,TO_CHAR(created_At,'YYYY-MM-DD') as dbday,num "
			+"FROM (SELECT cno,hit,name,title,filesize,type,created_At,rownum as num "
			+"FROM (SELECT cno,hit,name,title,filesize,type,created_At "
			+"FROM pet_community_2_1 WHERE type=#{type} ORDER BY cno DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<CommunityVO> communityListData(Map map);
	
	
	  @Select("SELECT CEIL(COUNT(*)/10.0) FROM pet_community_2_1") 
	  public int communityTotalPage();
	 
	
	
	@SelectKey(keyProperty = "cno",resultType = int.class,before = true, 
	statement = "SELECT NVL(MAX(cno)+1,1) as cno FROM pet_community_2_1")
	 
	/*
	 * CNO        NOT NULL NUMBER         
MNO                 NUMBER         
TITLE      NOT NULL VARCHAR2(300)  
CONTENT    NOT NULL VARCHAR2(4000) 
CREATED_AT          DATE           
TYPE       NOT NULL VARCHAR2(300)  
HIT                 NUMBER         
NAME       NOT NULL VARCHAR2(20)   
PWD        NOT NULL VARCHAR2(20)   
FILESIZE            VARCHAR2(4000) 
FILENAME            VARCHAR2(4000)
	 */
	@Insert("INSERT INTO pet_community_2_1 VALUES(" 
			+ "#{cno},4,#{title},#{content},SYSDATE,#{type},0,#{name},#{pwd},#{filesize},#{filename})")
	public void communityInsert(CommunityVO vo);
	  
	@Update("UPDATE pet_community_2_1 SET "
			+"hit=hit+1 "
			+"WHERE cno=#{cno}")
	public void communityHitIncrement(int cno);
	
	@Select("SELECT cno,name,title,content,filesize,filename,TO_CHAR(created_At,'YYYY-MM-DD') as dbday,hit "
			+"FROM pet_community_2_1 "
			+"WHERE cno=#{cno}")
	public CommunityVO communityDetailData(int cno);
	
	@Select("SELECT pwd FROM pet_community_2_1 " 
			+"WHERE cno=#{cno}")
	public String communityGetPassword(int no);
	
	@Update("UPDATE pet_community_2_1 SET "
			+"name=#{name},title=#{title},content=#{content} "
			+"WHERE cno=#{cno}")
	public void communityUpdate(CommunityVO vo);
	
	@Delete("DELETE FROM pet_community_2_1 "
			+"WHERE cno=#{cno}")
	public void communityDelete(int cno);
	
	@Select("SELECT filename,filesize FROM pet_community_2_1 WHERE cno=#{cno}")
	   public CommunityVO communityFileInfoData(int cno);
	
}
