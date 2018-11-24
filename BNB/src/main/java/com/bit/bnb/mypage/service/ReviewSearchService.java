package com.bit.bnb.mypage.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.mypage.dao.ReviewDao;
import com.bit.bnb.mypage.model.ReviewSearchVO;
import com.bit.bnb.mypage.model.ReviewVO;

@Service
public class ReviewSearchService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private ReviewDao reviewDao;

	public List<ReviewVO> reviewSearchList(String userId, ReviewSearchVO rvs) {

		reviewDao = sqlSessionTemplate.getMapper(ReviewDao.class);
		return reviewDao.searchReview(userId, rvs);
	}

	public List<ReviewVO> HostReviewSearchList(String userId, ReviewSearchVO rvs) {

		reviewDao = sqlSessionTemplate.getMapper(ReviewDao.class);
		return reviewDao.searchReviewHost(userId, rvs);
	}

}
