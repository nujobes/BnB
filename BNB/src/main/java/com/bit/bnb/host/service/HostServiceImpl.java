
package com.bit.bnb.host.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bit.bnb.host.dao.HostDao;
import com.bit.bnb.host.model.HostModel;

@Service
public class HostServiceImpl implements HostService {

	//dao호출
	
	@Inject
	private HostDao dao;
	
	@Override
	public void create(HostModel hostModel) throws Exception {
		dao.create(hostModel);
	}

	@Override
	public List<HostModel> listAll() throws Exception {
		System.out.println("서비스진입");
		List<HostModel> list = new ArrayList<HostModel>();
		list = dao.listAll();
		System.out.println("호스트서비스-리스트 : " + list);
		return dao.listAll();
		
	}

	@Override
	public HostModel read(int bId) throws Exception {
		return dao.read(bId);
	}

	@Override
	public void delete(int bId) throws Exception {
		dao.delete(bId);

	}

	@Override
	public void update(HostModel hostModel) throws Exception {
		dao.update(hostModel);

	
	}

	@Override
	public HostModel getContentbId(int bId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
