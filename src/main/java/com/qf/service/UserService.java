package com.qf.service;

import com.qf.pojo.User;

/**
 * 2019/10/2117:17
 * <p>
 * 未知的事情 永远充满变数
 */



public interface UserService {
    Integer insertUser(User user);

    User queryUserByUsername(String usernname);
}
