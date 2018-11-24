package com.bit.bnb.mypage.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.mypage.dao.ReviewDao;

@Service
public class ReviewDeleteService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ReviewDao reviewDao;
	
	public int reviewDelete(int reservationNum) {
		
		reviewDao = sqlSessionTemplate.getMapper(ReviewDao.class);
		
		return reviewDao.reviewDelete(reservationNum);
	}

}
