package com.frame.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frame.dao.SysDemoDao;
import com.frame.entity.SysDemoEntity;

@Service
public class SysDemoService {
	
	@Autowired
	private SysDemoDao sysDemoDao;

	public List<SysDemoEntity> queryList(Map<String, Object> map) {
		return sysDemoDao.queryList(map);
	}

}
