package com.bit.bnb.host.dao;

import java.util.List;

import javax.inject.Inject;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.bnb.host.model.CommentModel;

@Repository
public class CommentDaoImpl implements CommentDao {
	
	@Autowired
	SqlSessionTemplate SqlSession;


	
	@Override
	public int commentCount() throws Exception {
		return 0;
	}

	@Override
	public List<CommentModel> commentList(CommentModel commentModel) throws Exception {
	return SqlSession.selectList("CommentModel.commentList",commentModel);
	}

	@Override
	public int commentInsert(CommentModel commentModel) throws Exception {
		return SqlSession.insert("CommentModel.commentInsert", commentModel);
	}

	@Override
	public int commentUpdate(CommentModel commentModel) throws Exception {
		return SqlSession.update("CommentModel.commentUpdate", commentModel);
	}

	@Override
	public int commentDelete(int cno) throws Exception {
		return SqlSession.delete("CommentModel.commentDelete",cno);
	}

	
}
