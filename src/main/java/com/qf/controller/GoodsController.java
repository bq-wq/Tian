package com.qf.controller;

import com.qf.pojo.Goods;
import com.qf.pojo.Goods1;
import com.qf.service.Goods1Service;
import com.qf.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 2019/10/2317:19
 * <p>
 * 未知的事情 永远充满变数
 */

@Controller
@RequestMapping("/goods")
public class GoodsController {

    //商品详情


    @Autowired
    private GoodsService goodsService;  //查询商品详细信息
    @Autowired
    private Goods1Service goods1Service; //查询商品

      @RequestMapping("/show")
    public String showID(Integer id, HttpServletRequest request){

        Goods goods = goodsService.queryId(id);
        System.out.println("商品详细信息："+goods);
            request.setAttribute("goods",goods );
                //推荐商品按时间最新上架排序
        List<Goods1> goods2 =goods1Service.queryPx();
        System.out.println("查询新品推荐（详细信息处）："+goods2);

        request.setAttribute("goods2", goods2);

        return "detail";
    }







}
