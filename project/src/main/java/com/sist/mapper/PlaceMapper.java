package com.sist.mapper;

import com.sist.vo.*;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;
@Mapper
public interface PlaceMapper {

	/*@Select("SELECT pno, title, image "
			+"FROM pet_place_2_1 "
			+"WHERE pno=#{pno}")
	public List<PlaceVO> PlaceListData(int pno);*/


	//여행지 메인 출력
	@Select("SELECT pno, title, image FROM pet_place_2_1 WHERE pno BETWEEN 1 AND 20")
	public List<PlaceVO> PlaceListData();

	//여행지 무한 스크롤
	@Select("SELECT pno, title, image " +
			"FROM pet_place_2_1 " +
			"where pno = #{pno}")
	public List<PlaceVO> PlaceLisTInfinite(int page);

	//여행지 상세 출력
	@Select("select pno, image, title, address, tel, homepage, openhour, reserve, content, category "
			+ "FROM pet_place_2_1 "
			+ "where pno = #{pno}")
	public PlaceVO placeDetailData(int pno);

	// 조회수 증가
	@Update("UPDATE pet_place_2_1 SET "
			+ "hit=hit+1 "
			+ "WHERE pno=#{pno}")
	void PlaceHitIncrement(int pno);

	//여행지 메인 검색
	@Select("SELECT pno, title, image, category, address " +
			"FROM pet_place_2_1 " +
			"WHERE address LIKE '%'||#{address}||'%' AND category LIKE '%'||#{category}||'%' AND title LIKE '%'||#{title}||'%'")
	public List<PlaceVO> PlacesSearch(@Param("address") String address, @Param("category") String category, @Param("title") String title);
	//찜취소
	/*@Delete("DELETE FROM gg_allJjim_4 "
			+"WHERE pjno=#{pjno} and pno=#{pjno}")
	public void PlaceJjimDelete(int pjno,int no);*/
	/*@Results({
			@Result(property = "dvo.dname",column = "dname"),
			@Result(property = "dvo.loc",column = "loc")
	})*/
	@Insert("INSERT INTO pet_place_jjim_2_1 (pjno, image, title, create_at, pno, mno, category) " +
			"SELECT (SELECT NVL(MAX(pjno)+1,1) FROM pet_place_jjim_2_1), p.image, p.title, SYSDATE, p.pno, m.mno, p.category " +
			"FROM pet_place_2_1 p, pet_member_2_1 m " +
			"WHERE p.pno = #{pno} AND m.mno = #{mno}")
	public int addJjim(@Param("pno") int pno, @Param("mno") int mno);


	@Select("select pno, title, image " +
			"FROM pet_place_2_1 " +
			"order by #{sort} desc")
	public List<PlaceVO> placeListSort(String sort);

	@Select("SELECT COUNT(*) FROM PET_PLACE_JJIM_2_1 WHERE mno = #{mno} AND category IN(${category})")
	int placeLikeCount(@Param("mno") int mno, @Param("category") String category);

	@Select("SELECT * FROM PET_PLACE_JJIM_2_1 WHERE mno = #{mno} AND category IN(${category}) " +
			"ORDER BY PJNO DESC OFFSET ${page} ROW FETCH FIRST 9 ROWS ONLY")
	List<PlacejjimVO> placeLikeList(@Param("mno") int mno, @Param("page") int page, @Param("category") String category);

	@Select("SELECT COUNT(*) FROM PET_BEST_TIP_REPLY_2_1 WHERE mno = #{mno}")
	int bestTipReviewLikeCount(@Param("mno") int mno);

	@Select("SELECT * FROM PET_BEST_TIP_REPLY_2_1 WHERE mno = #{mno} " +
			"ORDER BY BRNO DESC OFFSET ${page} ROW FETCH FIRST 10 ROWS ONLY")
	List<BestTipVO> bestTipList(@Param("mno") int mno, @Param("page") int page);

	@Select("SELECT COUNT(*) FROM PET_COMMUNITY_REPLY_2_1 WHERE mno = #{mno}")
	int commnuityReviewCount(@Param("mno") int mno);

	@Select("SELECT * FROM PET_COMMUNITY_REPLY_2_1 WHERE mno = #{mno} " +
			"ORDER BY CRNO DESC OFFSET ${page} ROW FETCH FIRST 10 ROWS ONLY")
	List<CommunityReplyVO> communityReviewList(@Param("mno") int mno, @Param("page") int page);

	@Select("SELECT COUNT(*) FROM PET_PLACE_REVIEW_2_1 WHERE mno = #{mno}")
	int placeReviewCount(@Param("mno") int mno);

	@Select("SELECT * FROM PET_PLACE_REVIEW_2_1 WHERE mno = #{mno} " +
			"ORDER BY PRNO DESC OFFSET ${page} ROW FETCH FIRST 10 ROWS ONLY")
	List<PlaceReviewVO> placeReviewList(@Param("mno") int mno, @Param("page") int page);

	@Select("SELECT COUNT(*) FROM PET_COMMUNITY_2_1 WHERE mno = #{mno}")
	int communityCount(@Param("mno") int mno);

	@Select("SELECT * FROM PET_COMMUNITY_2_1 WHERE mno = #{mno} " +
			"ORDER BY CNO DESC OFFSET ${page} ROW FETCH FIRST 10 ROWS ONLY")
	List<CommunityVO> communityList(@Param("mno") int mno, @Param("page") int page);

}
