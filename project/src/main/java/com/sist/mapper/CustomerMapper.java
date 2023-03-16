package com.sist.mapper;

import java.util.*;

import com.sist.vo.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

/*
    private int nno;

    private String subject;

    private String content;

    private String pwd;

    private String type;

    private String dbday;

    private Date createdAt;

    private int mno;
 */
@Mapper
public interface CustomerMapper {

    // 고객센터 1:1 문의 목록 출력
    /*@Select("SELECT nno,subject,name,regdate,hit,num "
            + "FROM (SELECT nno,subject,name,regdate,hit,rownum as num "
            + "FROM (SELECT nno,subject,name,regdate,hit "
            + "FROM PET_HELP_2_1 ORDER BY nno DESC)) "
            + "WHERE num BETWEEN #{start} AND #{end}")*/
	@Select("SELECT nno,subject,name,TO_CHAR(regdate,'YY/MM/DD') as dbday, hit "
			+ "FROM PET_HELP_2_1 ORDER BY nno DESC OFFSET ${page} ROW FETCH FIRST 10 ROWS ONLY")
    List<CustomerVO> csBoardListData(@Param("page") int page);

    // 페이지네이션 (10개씩 페이지 나누기)
    @Select("SELECT COUNT(*) FROM PET_HELP_2_1")
    int csBoardTotalPage();

    // 게시판 데이터 삽입
    
    @Insert("INSERT INTO PET_HELP_2_1 (nno,subject,content,pwd,mno,name) "
    		+ "VALUES (PET_HELP_SEQ.NEXTVAL ,#{vo.subject}, #{vo.content}, #{vo.pwd}, #{mno}, #{nickname})")
    void csBoardInsert(@Param("vo") CustomerVO vo,@Param("mno") int mno, @Param("nickname") String name);

    // 조회수 증가
    @Update("UPDATE PET_HELP_2_1 SET "
            + "hit=hit+1 "
            + "WHERE nno=#{nno}")
    void csBoardHitIncrement(int nno);

    //게시판 데이터 상세보기
    @Select("SELECT nno,name,subject,content,TO_CHAR(regdate,'YY/MM/DD') as dbday,hit "
            + "FROM PET_HELP_2_1 "
            + "WHERE nno=#{nno}")
    CustomerVO csBoardDetailData(int nno);

    // 게시글 수정/삭제 시 비밀번호 확인
    @Select("SELECT pwd FROM PET_HELP_2_1 WHERE nno=#{nno}")
    String csBoardGetPassword(int nno);

    // 게시글 수정하기
    @Update("UPDATE PET_HELP_2_1 SET "
            + "subject=#{subject},content=#{content} "
            + "WHERE nno=#{nno}")
    void csBoardUpdate(CustomerVO vo);

    // 게시글 삭제하기
    @Delete("DELETE FROM PET_HELP_2_1 WHERE nno=#{nno}")
    void csBoardDelete(int nno);

    // 파일 첨부1
    @Select("SELECT filename,filesize FROM pet_HELP_2_1 WHERE nno=#{nno}")
	   public CustomerVO customerFileInfoData(int nno);
    
    @Insert("INSERT INTO pet_HELP_2_1 VALUES(" 
			+ "#{nno},5,#{subject},#{content},#{pwd},SYSDATE,#{type},0,#{name},#{filesize},#{filename})")
	public void csFileInsert(CustomerVO vo);
    
    // 댓글
    // 해당 게시글 db에 댓글 저장(관리자가 댓글 달고 저장) 관리자만
    @Insert("INSERT INTO pet_HELP_REPLY_2_1 (hrno,nno,msg) VALUES (PET_HELP_REPLY.NEXTVAL, #{nno},#{msg})")
    public void csReplySave(CustomerReplyVO vo);
    
    // 관리자가 작성한 게시글 내용 가져오기(관리자가 작성한 댓글 가져오기) 일반 사용자도 볼수있게
    @Select("SELECT * FROM PET_HELP_REPLY_2_1 WHERE nno=#{nno}")
    public CustomerReplyVO csReplyData(int nno);
    
    
    

}
