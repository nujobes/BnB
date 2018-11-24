package com.bit.bnb.mypage.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bnb.mypage.dao.MypageUserDao;

@Service
public class MypageUserDeleteService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private MypageUserDao mypageUserDao;
	
	public int userDelete(String userId) {
		
		mypageUserDao = sqlSessionTemplate.getMapper(MypageUserDao.class);
		
		return mypageUserDao.userDelete(userId);
		
	}

	
	
}
