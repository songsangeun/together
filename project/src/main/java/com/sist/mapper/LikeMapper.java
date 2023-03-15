package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.sist.vo.LikeVO;

public interface LikeMapper {
@SelectKey(keyProperty="no",resultType=int.class,before=true,
			statement="SELECT NVL(MAX(no)+1,1) as no FROM pet_best_tip_like_2_1")
@Insert("INSERT INTO pet_best_tip_like_2_1 VALUES("
		+"#{mno},#{bno},#{like}")
public void likeInsert(LikeVO vo);
}
