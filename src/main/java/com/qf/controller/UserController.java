package com.qf.controller;

import com.qf.pojo.User;
import com.qf.service.UserService;
import com.qf.utils.Captcha1;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * 2019/10/2117:22
 * <p>
 * 未知的事情 永远充满变数
 */

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

        @GetMapping("/regist")
        public String registpage(){
            System.out.println("goto regist page");
            return "forward:/WEB-INF/register.jsp";
        }

        @PostMapping("regist")
        public  String regist(User user){
                    System.out.println(user.toString());
                userService.insertUser(user);
                return "forward:/WEB-INF/login.jsp";
        }


    @GetMapping("login")
    public String loginpage(){
        System.out.println("goto login page");
        return "forward:/WEB-INF/login.jsp";
    }

    @PostMapping("login")
    public String login(User user,HttpServletResponse response)throws Exception{
        System.out.println(user);
        //获取subject 调用login
        Subject subject = SecurityUtils.getSubject();
        // 创建登录 delingpai
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),user.getPassword());
        System.out.println(token);
        subject.login(token);
        response.setContentType("text/html;charset=utf-8");
       response.getWriter().write("1");
        return "index";

    }
    @RequestMapping("/checkUserName")
    public  String checkUserName(User user, HttpServletResponse response)throws Exception{
        String username =user.getUsername();
        if(username==null||username.trim().length()==0){
            return null;
        }

        User user1 = userService.queryUserByUsername(username);
        if(user1!=null){
            response.getWriter().write("1");
        }else{
            response.getWriter().write("0");
        }
        return null;
    }

    @RequestMapping("/test2")
    public void test2(HttpSession session, HttpServletResponse res, HttpServletRequest req) throws IOException {
        Captcha1.generateCaptcha(req,res);


    }
    @RequestMapping("/test3")
    public String  test3(HttpSession session, HttpServletResponse res, HttpServletRequest req) throws IOException {
       // Captcha1.generateCaptcha(req,res);
        Integer captcha =(Integer) session.getAttribute("captcha");
        String client = req.getParameter("valcode");
        int c = Integer.parseInt(client);
        System.out.println("client:"+c);
        System.out.println("captcha:"+captcha);
        if(c==captcha){
            res.getWriter().write("0");
        }
        else{
            res.getWriter().write("1");
        }
        return null;

    }

    @RequestMapping("/logout")
    public String logout(){
        SecurityUtils.getSubject().logout();
        return "index";
    }




}
