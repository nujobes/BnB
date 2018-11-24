package com.bit.bnb.mypage.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.mypage.dao.ReviewDao;
import com.bit.bnb.mypage.model.ReviewVO;

@Service
public class ReviewEditService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ReviewDao reviewDao;
	
	public int reviewEdit(ReviewVO review) {
		
		reviewDao = sqlSessionTemplate.getMapper(ReviewDao.class);
		
		return reviewDao.reviewEdit(review);
	}
	
	public ReviewVO reviewPick(int reservationNum) {
		
		reviewDao = sqlSessionTemplate.getMapper(ReviewDao.class);
		
		return reviewDao.reviewPick(reservationNum);
		
	}

}
