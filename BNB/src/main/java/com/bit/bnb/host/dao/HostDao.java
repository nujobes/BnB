package com.bit.bnb.host.dao;

import java.util.List;

import com.bit.bnb.host.model.HostModel;

public interface HostDao {
	//create,read,update,delete,listAll
	
	public void create(HostModel hostModel) throws Exception;
	
	public List<HostModel> listAll() throws Exception;
	
	public HostModel read(int bId) throws Exception;
	
	public void delete(int bId)throws Exception;
	
	public void update(HostModel hostModel)throws Exception;

}
