package com.frame.web.module.sys.dao;

import com.frame.web.module.sys.entity.ZzbmDO;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * InnoDB free: 8192 kB Mapper 接口
 * </p>
 *
 * @author zhangzm
 * @since 2018-12-10
 */
public interface ZzbmDao extends BaseMapper<ZzbmDO> {

	String selectMaxZzbmDm(String bmid);
	
	List<ZzbmDO> selectByParentId(String zzid);
	
	ZzbmDO selectById(String zzid);

}
