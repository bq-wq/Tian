package com.qf.controller;

import com.github.pagehelper.PageInfo;
import com.qf.pojo.Goods1;
import com.qf.service.Goods1Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 2019/10/2315:07
 * <p>
 * 未知的事情 永远充满变数
 */
@Controller
@RequestMapping("/goods1")
public class Goods1Controller {



    @Autowired
    private Goods1Service goods1Service;


    @RequestMapping("/goodsall")
    private  String Goodsall(HttpServletRequest request ,int typeid){
        System.out.println("查询所有 主页显示!"+typeid);
        List<Goods1> list2 = goods1Service.queryall(typeid);
        System.out.println("-------"+list2);
        request.setAttribute("list2",list2 );




        return "forward:/WEB-INF/list2.jsp";

    }


    @RequestMapping("/showall")
    private String showAll(String pageNum,String pageSize,String price,HttpServletRequest request){
        System.out.println("查询所有 发送到列表页面!");
        //List<Goods1> list3 = goodsService.queryall1(1);
       // System.out.println("-------"+list3);

        System.out.println(pageNum+"---"+pageSize+"  price "+price);
        int pn=1;
        int ps=8;

       if (pageNum!=null|| pageNum.trim().length()==0){
            pn = Integer.parseInt(pageNum);
            if (pn<1){
                pn=1;
            }
        }
        if (pageSize!=null|| pageSize.trim().length()==0){
            ps = Integer.parseInt(pageSize);
            if (ps<1){
                ps=8;
            }
        }


        PageInfo<Goods1> pageInfo = goods1Service.queryall1(1,pn, ps,price);
        request.setAttribute("pageBean", pageInfo);

        //推荐商品按时间最新上架排序
            List<Goods1> goods1 =goods1Service.queryPx();
        System.out.println("查询新品推荐："+goods1);
        request.setAttribute("goods1", goods1);

        return "forward:/list.jsp";
    }









}


