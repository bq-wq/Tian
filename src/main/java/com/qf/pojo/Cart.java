package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * 2019/10/2416:55
 * <p>
 * 未知的事情 永远充满变数
 */


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private Integer uid;
    private Integer pid;
    private String name;
    private BigDecimal price;
    private  int num;
    private String imapath;



}
