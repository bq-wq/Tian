package com.qf.dao;

import com.qf.pojo.Goods1;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 2019/10/2315:36
 * <p>
 * 未知的事情 永远充满变数
 */
public interface Goods1DAO {
    List<Goods1> queryall(@Param("typeid") int typeid);

    List<Goods1> queryall1(@Param("typeid") int typeid,@Param("price")String price);

    List<Goods1> queryPx();


    Goods1 queryID(@Param("id") Integer id);
}
