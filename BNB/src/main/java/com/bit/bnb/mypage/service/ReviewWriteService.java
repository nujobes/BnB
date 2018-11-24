package com.bit.bnb.mypage.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.mypage.dao.ReviewDao;
import com.bit.bnb.mypage.model.ReviewVO;

@Service
public class ReviewWriteService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private ReviewDao reviewDao;
	
	public int reviewWrite(ReviewVO review) {
		
		reviewDao = sqlSessionTemplate.getMapper(ReviewDao.class);
		
		return reviewDao.reviewWrite(review);
		
	}

}
