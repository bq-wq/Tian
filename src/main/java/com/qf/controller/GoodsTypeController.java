package com.qf.controller;

import com.qf.pojo.GoodsType;
import com.qf.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 2019/10/2311:16
 * <p>
 * 未知的事情 永远充满变数
 */
@Controller
@RequestMapping("/goodstype")
public class GoodsTypeController {

    @Autowired
    private GoodsTypeService goodsTypeService;

        @RequestMapping("/selectall")
        public String selectall(HttpServletRequest request){

            System.out.println("查询所有!");
            List<GoodsType> list = goodsTypeService.selectall();
            request.setAttribute("list",list );

            return "forward:/WEB-INF/list1.jsp";
        }




}
