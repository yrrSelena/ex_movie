package com.yrr.controller;

import com.yrr.bean.Msg;
import com.yrr.bean.User;
import com.yrr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import javax.servlet.http.HttpSession;


@Controller
/**
 * 说明此类的访问地址
 */
//@RequestMapping("/admin")

@SessionAttributes("user")
public class UserController {
    @Autowired
    private UserService userService;


    @RequestMapping("/home")
    public String index(){
        return "index";
    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Msg checkLoginWithJson(String username, String password){
        User loginUser = userService.checkLogin(username, password);
        if(loginUser!=null){
            return Msg.success().add("loginUser",loginUser);
        }
        else{
            return Msg.fail();
        }

    }

    /**
     * 说明该方法的访问地址是 /admin/login ，请求方式是http请求的get方式
     * @return
     */
    //@RequestMapping(value = "/login",method = RequestMethod.GET)
    public String checkLogin(){
        return "/admin_login.jsp"; //z直接返回web页面的名字
    }

    //@RequestMapping(value = "/login", method = RequestMethod.POST)
    public  String checkLogin(User user, Model model){//HttpServletRequest request, HttpServletResponse response) {//(@Param("username") String username, @Param("password") String password, Model model){

        //System.out.println(user.getUsername());
        /*
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username);
        System.out.println(password);
        */
        User loginUser = userService.checkLogin(user.getUsername(),user.getPassword());
        if(loginUser!=null){
            model.addAttribute("user",loginUser);
            //request.getSession().setAttribute("user",loginUser);
            return "admin_home";
        }
        else {
            //model.addAttribute("msg","用户名或密码错误")；
            //request.getSession().setAttribute("user",null);
            return "/admin_login.jsp";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        //注销当前的session
        session.invalidate();
        return "/admin_login.jsp";
    }



}
