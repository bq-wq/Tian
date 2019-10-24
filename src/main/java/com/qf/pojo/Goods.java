package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 2019/10/2317:26
 * <p>
 * 未知的事情 永远充满变数
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {

    private Integer id ;
    private String name;
    private Date pubdate;
    private String imgPath;
    private  String intro;
    private Integer typeid;
    private Double price;


}
