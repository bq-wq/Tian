package com.qf.dao;

import com.qf.pojo.Goods;
import org.apache.ibatis.annotations.Param;

/**
 * 2019/10/2317:31
 * <p>
 * 未知的事情 永远充满变数
 */
public interface GoodsDAO {

    //根据id查询所有
    Goods queryId(@Param("id") Integer id);



}
