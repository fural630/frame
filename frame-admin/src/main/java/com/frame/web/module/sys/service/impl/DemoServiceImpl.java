package com.frame.web.module.sys.service.impl;

import com.frame.web.module.sys.entity.Demo;
import com.frame.web.module.sys.mapper.DemoMapper;
import com.frame.web.module.sys.service.IDemoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhangzm
 * @since 2018-11-23
 */
@Service
public class DemoServiceImpl extends ServiceImpl<DemoMapper, Demo> implements IDemoService {

}
