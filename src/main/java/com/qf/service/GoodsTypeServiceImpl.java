package com.qf.service;

import com.qf.dao.GoodsTypeDAO;
import com.qf.pojo.GoodsType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 2019/10/2311:12
 * <p>
 * 未知的事情 永远充满变数
 */
@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {

    @Autowired
    private GoodsTypeDAO goodsTypeDAO;
    @Override
    public List<GoodsType> selectall() {
        return  goodsTypeDAO.queryall();
    }
}
