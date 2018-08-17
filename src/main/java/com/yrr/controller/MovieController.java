package com.yrr.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yrr.bean.Movie;
import com.yrr.bean.Msg;
import com.yrr.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * 处理电影CRUD请求
 */
@Controller
public class MovieController {

    @Autowired
    MovieService movieService;

    /**
     * 为使ResponseBody正常使用，需要导入jackson包
     * @param pn
     * @return
     */
    @RequestMapping("/movies")
    @ResponseBody
    public Msg getMoviesWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn){

        //这不是一个分页查询，
        //引入PageHelper分页插件
        //在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,10);
        //startPage后面紧跟的这个查询就是一个分页查询
        List<Movie> movies = movieService.getAll();
        //使用PageInfo包装查询后的结果，只需将PageInfo交给页面就行
        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(movies,10);
        return Msg.success().add("pageInfo",page);
    }

    /**
     * 查询电影数据（分页查询）
     * @return
     */
    //处理请求
    //@RequestMapping("/movies")
    public String getMovies(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                            Model model){
        //这不是一个分页查询，
        //引入PageHelper分页插件
        //在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,10);
        //startPage后面紧跟的这个查询就是一个分页查询
        List<Movie> movies = movieService.getAll();
        //使用PageInfo包装查询后的结果，只需将PageInfo交给页面就行
        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(movies,10);
        model.addAttribute("pageInfo",page);

        return "movieList";
    }


}
