package com.qf.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf.dao.Goods1DAO;
import com.qf.pojo.Goods1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 2019/10/2315:51
 * <p>
 * 未知的事情 永远充满变数
 */
@Service
public class Goods1ServiceImpl implements Goods1Service {


    @Autowired
    private Goods1DAO goods1DAO;

    @Override
    public List<Goods1> queryall(int typeid) {
        return goods1DAO.queryall(typeid);
    }

    @Override
    public PageInfo<Goods1> queryall1(int typeid , Integer pageNum, Integer pageSize,String price) {
        PageHelper.startPage(pageNum,pageSize);
        List<Goods1>  list =goods1DAO.queryall1(typeid,price);
        PageInfo<Goods1> pageInfo = new PageInfo<>(list);






        return pageInfo;
    }

    @Override
    public List<Goods1> queryPx() {
        return goods1DAO.queryPx();
    }

    @Override
    public Goods1 queryID(Integer id) {
        return goods1DAO.queryID(id);
    }


}
