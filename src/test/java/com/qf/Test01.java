package com.qf;

import com.qf.dao.GoodsDAO;
import com.qf.dao.GoodsTypeDAO;
import com.qf.dao.UserDAO;
import com.qf.pojo.Goods;
import com.qf.pojo.GoodsType;
import com.qf.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * 2019/10/2117:02
 * <p>
 * 未知的事情 永远充满变数
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Test01 {

    @Test
    public void  dAOTest(){
        ClassPathXmlApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserDAO userDAO = context.getBean("userDAO",UserDAO.class);
        //User user = new User(null,"阿尔fgh","123","2345678@qq.com");
        //userDAO.insertUser(user);
        User user = userDAO.queryUsername("阿尔fgh");
        System.out.println(user);

    }


    @Test
    public  void dAOgoodsType()  {
        ClassPathXmlApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
        GoodsTypeDAO  goodsTypeDAO= context.getBean("goodsTypeDAO",GoodsTypeDAO.class);
        List<GoodsType> sd =goodsTypeDAO.queryall();
        for (GoodsType goodsType : sd) {
            System.out.println(goodsType.toString());
        }
    }
    @Test
    public void dAoGoods1(){
        ClassPathXmlApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
        GoodsDAO goodsDAO =context.getBean("goodsDAO",GoodsDAO.class);
        Goods goods =goodsDAO.queryId(2);
        System.out.println(goods.toString());

        /*Goods1DAO goodsDAO = context.getBean("goods1DAO", Goods1DAO.class);
            List<Goods1> list2 = goodsDAO.queryall();
        for (Goods1 goods : list2) {
            System.out.println(goods);
        }*/
    }



}
