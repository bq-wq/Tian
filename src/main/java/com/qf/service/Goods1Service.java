package com.qf.service;

import com.github.pagehelper.PageInfo;
import com.qf.pojo.Goods1;

import java.util.List;

/**
 * 2019/10/2315:49
 * <p>
 * 未知的事情 永远充满变数
 */

public interface Goods1Service {

    List<Goods1> queryall(int typeid);

   // List<Goods1> queryall1(int typeid);
     PageInfo<Goods1> queryall1(int typeid , Integer pageNum, Integer pageSize,String price);


    List<Goods1> queryPx();

    Goods1 queryID(Integer id);
}
