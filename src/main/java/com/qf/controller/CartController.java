package com.qf.controller;

import com.qf.pojo.Cart;
import com.qf.pojo.Goods1;
import com.qf.pojo.User;
import com.qf.service.CartService;
import com.qf.service.Goods1Service;
import com.qf.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;

/**
 * 2019/10/2416:21
 * <p>
 * 未知的事情 永远充满变数
 */
@Controller
@RequestMapping("cart")
public class CartController {

    @Autowired
    private CartService cartService;
    @Autowired
    private UserService userService;
    @Autowired
    private Goods1Service goods1Service;


    @GetMapping("/goto")
    public String  goto1(HttpServletRequest request){
        System.out.println("go to cart!");

        System.out.println("show ccart!");
        List<Cart> list = cartService.showALl();
        System.out.println("查出购物车信息："+list);

        request.setAttribute("list",list );

        return "forward:/WEB-INF/cart.jsp";

    }

    @RequestMapping("addcart")
    public String addCart(Integer pid,int num){
        System.out.println("商品 id:"+pid+"商品数量:"+num);
      // Object  user = SecurityUtils.getSubject().getSession().getAttribute("user");
        //System.out.println("获取用户信息:"+user);
        //判断是否为空省略  一会添加
       // Cart cart = cartService.findByUidAndPid(, );
        //根据姓名判断用户
        Object username1 = SecurityUtils.getSubject().getPrincipal();
        String username = (String) username1;
        System.out.println("用户姓名:"+username);
        User user =userService.queryUserByUsername(username);
        System.out.println(user.toString());
            Cart cart = cartService.findByUidAndPid(user.getId(), pid);
        System.out.println("查询商品:"+cart);
        //Cart cart
          //判断
        //1获取添加的商品
        Goods1 goods1 = goods1Service.queryID(pid);
        //数量 num

        try{


        if(cart == null){
                //添加
            cart = new Cart(user.getId(),pid,goods1.getTitle(),goods1.getPrice().multiply(new BigDecimal(num)),num,"");
            cartService.addCart(cart);
        }else{
            //更新
            cart.setNum(cart.getNum()+num);
            System.out.println("更新后的数量："+cart.getNum());
            cart.setPrice(goods1.getPrice().multiply(new BigDecimal(cart.getNum())));
            cartService.updateCart(cart);
        }
        return null;
        //return "redirect:/cartSuccess.jsp";
        }catch  (NumberFormatException e) {
            e.printStackTrace();
            return "redirect:/index.jsp";
        }

    }
    @RequestMapping("/addCartAjax")
    public String addCartAjax(HttpServletRequest request, HttpServletResponse response,Integer pid){






        return null;
    }







}
