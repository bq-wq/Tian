package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 2019/10/2315:37
 * <p>
 * 未知的事情 永远充满变数
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods1 {
    private int id;
    private String title;
    private String imapath;
    private String price;
    private int typeid;
    private Date pubdate;


}
