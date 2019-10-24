package com.qf.service;

import com.qf.dao.GoodsDAO;
import com.qf.pojo.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 2019/10/2317:43
 * <p>
 * 未知的事情 永远充满变数
 */
@Service
public class GoodsServiceImpl implements GoodsService{

    @Autowired
    private GoodsDAO goodsDAO;

    @Override
    public Goods queryId(Integer id) {
        return goodsDAO.queryId(id);
    }
}
