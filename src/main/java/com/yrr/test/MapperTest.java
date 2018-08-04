package com.yrr.test;

import com.yrr.dao.TypeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 测试dao层工作
 * 可以使用Spring单元测试，自动注入需要的组件
 * 1 导入SpringTest单元测试模块
 * 2 @ContextConfiguration指定Spring配置文件的位置
 * 3 直接autowired要使用的组件
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    TypeMapper typeMapper;
    /**
     * 测试TypeMapper
     */
    @Test
    public void testCRUD(){
        /*
        //1 创建SpringIOC容器
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        //2 从容器中获取Mapper
        TypeMapper bean = ioc.getBean(TypeMapper.class);
        */
        System.out.println(typeMapper);

    }
}
