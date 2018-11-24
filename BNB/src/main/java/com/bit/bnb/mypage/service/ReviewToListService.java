package com.bit.bnb.mypage.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.mypage.dao.ReviewDao;
import com.bit.bnb.mypage.model.ReviewVO;

@Service
public class ReviewToListService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private ReviewDao reviewDao;

	public List<ReviewVO> reviewToListView(String userId) { // 내가 쓴 후기

		reviewDao = sqlSessionTemplate.getMapper(ReviewDao.class);

		return reviewDao.reviewToList(userId);
	}

	public List<ReviewVO> reviewWriteList(String userId) { // 써야할리스트

		reviewDao = sqlSessionTemplate.getMapper(ReviewDao.class);

		return reviewDao.reviewWriteList(userId);
	}
	
	public List<ReviewVO> hostReview(String userId) { // 호스트가 써준거 ㅎ
		
		reviewDao = sqlSessionTemplate.getMapper(ReviewDao.class);
		
		return reviewDao.hostReview(userId);
	}

}
