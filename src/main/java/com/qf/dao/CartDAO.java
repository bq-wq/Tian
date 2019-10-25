package com.qf.dao;

import com.qf.pojo.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 2019/10/2417:23
 * <p>
 * 未知的事情 永远充满变数
 */
public interface CartDAO {

    Cart findByUidPid(@Param("uid") int uid,@Param("pid") int pid) ;


    void addCart(Cart cart);

    void updateCart(Cart cart);

    List<Cart> queryAll();
}
