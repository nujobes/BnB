package com.bit.bnb.host.service;

import java.util.List;

import com.bit.bnb.host.model.CommentModel;

	public interface CommentService {
	    // 댓글 개수
	    public int commentCount() throws Exception;
	 
	    // 댓글 목록
	    public List<CommentModel> commentList(CommentModel commentModel) throws Exception;
	 
	    // 댓글 작성
	    public int commentInsert(CommentModel commentModel) throws Exception;
	    
	    // 댓글 수정
	    public int commentUpdate(CommentModel commentModel) throws Exception;
	 
	    // 댓글 삭제
	    public int commentDelete(int cno) throws Exception;
	 
	}


	