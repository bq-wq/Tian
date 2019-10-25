package com.qf.service;

import com.qf.dao.CartDAO;
import com.qf.pojo.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 2019/10/2417:21
 * <p>
 * 未知的事情 永远充满变数
 */
@Service
public class CartServiceImpl implements CartService {
    @Autowired
    private CartDAO cartDAO;
    @Override
    public Cart findByUidAndPid(int uid, int pid) {
        return cartDAO.findByUidPid(uid,pid);
    }

    @Override
    public void addCart(Cart cart) {
        cartDAO.addCart(cart);
    }

    @Override
    public void updateCart(Cart cart) {
        cartDAO.updateCart(cart);
    }

    @Override
    public List<Cart> showALl() {
        return cartDAO.queryAll();
    }
}
