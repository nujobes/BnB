package com.bit.bnb.host.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bit.bnb.host.model.HostModel;

@Repository
public class HostDaoImpl implements HostDao {

	@Inject
	SqlSessionTemplate SqlSession;
	
	@Override
	public void create(HostModel hostModel) throws Exception {
		SqlSession.insert("hostModel.create", hostModel);
	}

	@Override
	public List<HostModel> listAll() throws Exception {
		return SqlSession.selectList("hostModel.listAll");
	}

	@Override
	public HostModel read(int bId) throws Exception {
		return SqlSession.selectOne("hostModel.read", bId);
	}

	@Override
	public void delete(int bId) throws Exception {
		SqlSession.delete("hostModel.delete",bId);

	}

	@Override
	public void update(HostModel hostModel) throws Exception {
		SqlSession.update("hostModel.update", hostModel);

	}

}
