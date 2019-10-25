package com.qf.cache;

import org.apache.ibatis.cache.Cache;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.context.ContextLoader;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * 2019/10/2516:35
 * <p>
 * 未知的事情 永远充满变数
 */
public class MyCache implements Cache {

    private String id ;//当前Mapper的namespace
    private final ReadWriteLock lock = new ReentrantReadWriteLock();
    RedisTemplate<String,Object>template;

    public MyCache(){}
    public MyCache(String id) {this.id=id;}
    @Override
    public String getId() {
        return this.id;
    }

    @Override
    public void putObject(Object o, Object o1) {
        System.out.println("添加缓存!");
        System.out.println("缓存数据，"+o+":"+o1);
        template.opsForValue().set(o.toString(),o1 ); //将结果放入缓存 redis 缓存起来备用
    }

            //获取缓存数据
    @Override
    public Object getObject(Object o) {
        System.out.println("添加缓存！");
        template = (RedisTemplate) ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate");
        System.out.println("检查缓存,key:"+o.getClass());
        Object cache = template.opsForValue().get(o.toString()); //通过sql语句从redis获取缓存
        if(cache!=null){
            return cache;
        }
        else {
            System.out.println("检查缓存 但未命中！");
            return null;
        }



    }

    @Override
    public Object removeObject(Object o) {
        return null;
    }

    @Override
    public void clear() {

    }

    @Override
    public int getSize() {
        return 0;
    }

    @Override
    public ReadWriteLock getReadWriteLock() {
        return this.lock;
    }
}
