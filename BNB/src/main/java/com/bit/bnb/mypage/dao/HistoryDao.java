package com.bit.bnb.mypage.dao;

import java.util.List;

import com.bit.bnb.mypage.model.HistoryVO;

public interface HistoryDao {
	
	public List<HistoryVO> historyList(String userId); // 다녀온 여행
	public List<HistoryVO> tripList(String userId); // 다녀갈 여행목록

}
