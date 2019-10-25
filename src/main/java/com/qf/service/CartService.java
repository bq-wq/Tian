package com.qf.service;

import com.qf.pojo.Cart;

import java.util.List;

/**
 * 2019/10/2417:16
 * <p>
 * 未知的事情 永远充满变数
 */
public interface CartService {
     Cart findByUidAndPid(int uid, int pid);


    void addCart(Cart cart);

    void updateCart(Cart cart);

    List<Cart> showALl();
}
