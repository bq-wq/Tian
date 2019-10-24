package com.qf.service;


import com.qf.constant.MyConstant;
import com.qf.dao.UserDAO;
import com.qf.pojo.User;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {

    //@Resource(name="userDAO2")
    @Resource
    private UserDAO userDAO;

    @Transactional(propagation = Propagation.SUPPORTS)
    public User queryUserByUsername(String username) {
        return userDAO.queryUsername(username);
    }

    @Override
    public Integer insertUser(User user) {
        // 加密
//        String salt = UUID.randomUUID().toString();
        String salt = "123";
        System.out.println("加密前密码："+user.getPassword());
        String s = new Sha256Hash(user.getPassword(), salt, MyConstant.INTERCOUNT).toBase64();
        System.out.println("s:"+s);
        // 设置密文
        user.setPassword(s);
        // 设置盐
        user.setSalt(salt);
        return userDAO.insertUser(user);
    }

    public static void main(String[] args) {
        String s = new Sha256Hash("123123123", "123", MyConstant.INTERCOUNT).toBase64();
        System.out.println("s:"+s);
    }
}