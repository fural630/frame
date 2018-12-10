package com.frame.web.module.sys.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.frame.util.Dumper;
import com.frame.web.module.sys.entity.RegionDO;
import com.sun.org.apache.regexp.internal.recompile;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RegionDaoTest {
	
	@Autowired
	private RegionDao regionDao;
	
	@Test
	public void testDeleteById() {
		String id = "2";
		Tree aTree = new Tree();
		next(id, aTree);
		Dumper.dump(aTree);
	}
	
	
	public void next(String id, Tree tree) {
		List<RegionDO> regionDOList = regionDao.selectByPid(id);
		if (CollectionUtils.isNotEmpty(regionDOList)) {
			for (RegionDO regionDO : regionDOList) {
				next(regionDO.getRegionId(), tree);
			}
		} else {
			RegionDO regionDO = regionDao.selectById(id);
			Tree newTree = new Tree();
			newTree.setLabel(regionDO.getRegionName());
			newTree.setValue(regionDO.getRegionId());
			List<Tree> childrenTree = tree.getChildren();
			if (CollectionUtils.isEmpty(childrenTree)) {
				childrenTree = new ArrayList<Tree>();
			}
			childrenTree.add(newTree);
			tree.setChildren(childrenTree);
		}
	}

}
