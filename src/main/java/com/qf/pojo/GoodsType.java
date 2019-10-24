package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 2019/10/2310:54
 * <p>
 * 未知的事情 永远充满变数
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsType {
    private  Integer id;
    private String title;
    private  String className;
    private Date creatTime ;
    private String bannerpath;



}
