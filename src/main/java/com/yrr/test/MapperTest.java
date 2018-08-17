package com.yrr.test;

import com.yrr.bean.Movie;
import com.yrr.dao.MovieMapper;
import com.yrr.dao.TypeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    TypeMapper typeMapper;

    @Autowired
    MovieMapper movieMapper;
    //UserMapper userMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCRUD(){

        /*
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        ioc.getBean(TypeMapper.class);
        */
        System.out.println(typeMapper);

        //1 删除类型
        //typeMapper.deleteByPrimaryKey(9);//.insertSelective(new Type(9,"high"));

        movieMapper.deleteByPrimaryKey(396);
        //2 生成电影，测试电影插入
        movieMapper.insertSelective(new Movie(null,"我不是药神","title",8f,"poster","translation_name",2018,"中国大陆",
                "汉语普通话","中英双字","2018-07-05(中国大陆)","文牧野","徐峥；周一围；王传君","introduction","screenshot","links"));

        //3 批量插入，使用可以执行批量操作的sqlSession

        /*for(){
            movieMapper.insertSelective(new Movie(null,"我不是药神","title",8f,"poster","translation_name",2018,"中国大陆",
                    "汉语普通话","中英双字","2018-07-05(中国大陆)","文牧野","徐峥；周一围；王传君","introduction","screenshot","links"));
        }*/
        MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
        for (int i=0;i<5;i++){
            String uid = UUID.randomUUID().toString().substring(0,5)+i;
            mapper.insertSelective(new Movie(null, uid,"title"+uid,8f,"poster","translation_name",2018,"中国大陆",
                    "汉语普通话","中英双字","2018-07-05(中国大陆)","文牧野","徐峥；周一围；王传君","introduction","screenshot","links"));
        }
        System.out.println("完成批量");
    }
}
