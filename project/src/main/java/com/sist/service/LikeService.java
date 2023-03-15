package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.mapper.LikeMapper;
import com.sist.vo.LikeVO;

@Service
public class LikeService {
	@Autowired
	private LikeMapper mapper;
	public void likeInsert(LikeVO vo)
	{
		mapper.likeInsert(vo);
	}
}
