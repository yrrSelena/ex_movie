package com.yrr.service;

import com.yrr.bean.User;
import com.yrr.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserMapper userMapper;

    /**
     * 检验用户登录
     * @param username
     * @param password
     * @return
     */
    public User checkLogin(String username,String password){
        User user=userMapper.selectByUsername(username);
        if (user!=null && user.getPassword().equals(password))
        {
            return user;
        }
        return null;
    }


}
