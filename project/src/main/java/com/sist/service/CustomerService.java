package com.sist.service;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.vo.CustomerVO;
import com.sist.mapper.CustomerMapper;

@Service
public class CustomerService {
	@Autowired
	private CustomerMapper mapper;
	    // 고객센터 1:1 문의 목록 출력
	  	/*@Select("SELECT nno,subject,name,createdAt,hit,num "
				+"FROM (SELECT nno,subject,name,createdAt,hit,rownum as num "
				+"FROM (SELECT nno,subject,name,createdAt,hit "
				+"FROM PET_HELP_2_1 ORDER BY nno DESC)) "
				+"WHERE num BETWEEN #{start} AND #{end}")*/
		public List<CustomerVO> csBoardListData(Map map)
		{
			return mapper.csBoardListData(map);
		}
		
		// 페이지네이션 (10개씩 페이지 나누기)
		//@Select("SELECT CEIL(COUNT(*)/10.0) FROM PET_HELP_2_1")
		public int csBoardTotalPage()
		{
			return mapper.csBoardTotalPage();
		}
		
		// 게시판 데이터 삽입
		/*@SelectKey(keyProperty="nno", resultType=int.class, before=true,
				statement="SELECT NVL(MAX(nno)+1,1) as nno FROM PET_HELP_2_")
		@Insert("INSERT INTO spring_board VALUES("
				+"{nno}, #{name}, #{subject}, #{content}, #{pwd}, SYSDATE,0)")*/
		public void csBoardInserst(CustomerVO vo, int mno, String nickname)
		{
			mapper.csBoardInserst(vo, mno, nickname);
		}
		
		// 조회수 증가
		/*@Update("UPDATE PET_HELP_2_1 SET "
				+"hit=hit+1 "
				+"WHERE nno=#{nno}")
		public void csBoardHitIncrement(int nno);
		
		//게시판 데이터 상세보기
		@Select("SELECT no,name,subject,content,createdAt,hit "
				+"FROM PET_HELP_2_1 "
				+"WHERE nno=#{nno}")*/
		public CustomerVO csBoardDetailData(int nno)
		{
			mapper.csBoardHitIncrement(nno);
			return mapper.csBoardDetailData(nno);
		}

		// 게시글 수정/삭제 시 비밀번호 확인
		/*@Select("SELECT pwd FROM PET_HELP_2_1 "
				+"WHERE nno=#{nno}")
		public String csBoardGetPassword(int nno);
		
		// 게시글 수정하기
		@Update("UPDATE PET_HELP_2_1 SET "
				+"name=#{name},subject=#{subject},content=#{content} "
				+"WHERE nno=#{nno}")
		public void csBoardUpdate(CustomerVO vo);
		
		// 게시글 삭제하기
		@Delete("DELETE FROM PET_HELP_2_1 "
				+"WHERE nno=#{nno}")
		public void csBoardDelete(int nno);*/
		
		public String csBoardUpdate(CustomerVO vo)
		{
			String res="nno";
			String db_pwd=mapper.csBoardGetPassword(vo.getNno());
			if(db_pwd.equals(vo.getPwd()))
			{
				mapper.csBoardUpdate(vo);
				res="yes";
			}
			return res;
		}
		
		public String csBoardDelete(int nno, String pwd)
		{
			String res="nno";
			String db_pwd=mapper.csBoardGetPassword(nno);
			if(db_pwd.equals(pwd))
			{
				mapper.csBoardDelete(nno);
				res="yes";
			}
			return res;
		}
		
	    // 파일 첨부
		/*@Insert("INSERT INTO pet_HELP_2_1 VALUES(" 
				+ "#{nno},5,#{subject},#{content},regdate,#{type},0,#{name},#{pwd},#{filesize},#{filename})")*/
		public void csFileInsert(CustomerVO vo)
		{
			mapper.csFileInsert(vo);
		}
		
	    //@Select("SELECT filename,filesize FROM pet_HELP_2_1 WHERE no=#{nno}")
		   public CustomerVO customerFileInfoData(int nno)
		   {
			   return mapper.customerFileInfoData(nno);
		   }
		   
		   
}
