package com.bit.bnb.host.service;

import java.util.List;



import com.bit.bnb.host.model.HostModel;

public interface HostService {
	
	//register, read,modify,remove,listall
	//컨트롤러와 dao를 연결해주는 서비스인터페이스
	
	//게시글작성
	public void create(HostModel hostModel)throws Exception;
	//글 목록
	public List<HostModel> listAll()throws Exception;
	//상세보기
	public HostModel read (int bId)throws Exception;
	//삭제
	public void delete (int bId)throws Exception;
	//수정
	public void update (HostModel hostModel) throws Exception;
/*	//조회수
	public void increaseViewcnt(int bId, HttpSession session)throws Exception;*/
	public HostModel getContentbId(int bId);





}
