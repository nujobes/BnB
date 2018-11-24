package com.bit.bnb.mypage.dao;

import com.bit.bnb.mypage.model.MemberVO;

public interface MypageUserDao {
	
	public int userUpdate(MemberVO member); // 유저정보 수정
	public MemberVO userPick(String userId); // 유저찾기
	public int userDelete(String userId); // 유저삭제

}
