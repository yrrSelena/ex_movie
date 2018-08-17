package com.yrr.service;

import com.yrr.bean.Movie;
import com.yrr.dao.MovieMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//业务逻辑组件
@Service
public class MovieService {

    @Autowired
    MovieMapper movieMapper;

    /**
     * 查询所有电影
     * @return
     */
    public List<Movie> getAll(){
        return movieMapper.selectByExample(null);
    }
}
