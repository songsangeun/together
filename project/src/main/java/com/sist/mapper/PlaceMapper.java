package com.sist.mapper;

import com.sist.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;
@Mapper
public interface PlaceMapper {

    /*@Select("SELECT pno, title, image "
            +"FROM pet_place_2_1 "
            +"WHERE pno=#{pno}")
    public List<PlaceVO> PlaceListData(int pno);*/
    
	@Select("SELECT pno, title, image FROM pet_place_2_1 WHERE pno BETWEEN 1 AND 21")
    public List<PlaceVO> PlaceListData();
	
	@Select("select pno, image, title, address, tel, homepage, openhour, reserve, content, category "
			+ "FROM pet_place_2_1 "
			+ "where pno = #{pno}")
	public List<PlaceVO> placeDetailData(int pno);

    /*@Select("SELECT fno,title,image,num "
            +"FROM (SELECT fno,title,image,rownum as num "
            +"FROM (SELECT fno,title,image "
            +"FROM pet_place_2_1 WHERE address LIKE '%'||#{address}||'%' ORDER BY fno ASC)) "
            +"WHERE num BETWEEN #{start} AND #{end}")
    public List<PlaceVO> placeSearchData(Map map);*/

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
