package com.qf.dao;

import com.qf.pojo.User;
import org.apache.ibatis.annotations.Param;

/**
 * 2019/10/2116:44
 * <p>
 * 未知的事情 永远充满变数
 */
public interface UserDAO {
    //注册
    Integer insertUser(User user);
    // 登入根据用户名查询用户信息
    User queryUsername(@Param("username")String username);


}
