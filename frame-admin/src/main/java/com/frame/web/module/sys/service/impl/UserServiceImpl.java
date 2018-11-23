package com.frame.web.module.sys.service.impl;

import com.frame.web.module.sys.entity.User;
import com.frame.web.module.sys.mapper.UserMapper;
import com.frame.web.module.sys.service.IUserService;
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
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

}
