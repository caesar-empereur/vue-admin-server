package com.controller;

import com.vo.LoginRequest;
import com.vo.LoginResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

/**
 * @Description
 * @author: yangyingyang
 * @date: 2020/5/11.
 */
@Api(description = "登陆接口")
@RestController
@RequestMapping(value = "/")
public class LoginController {

    private static final String TOKEN = UUID.randomUUID().toString().replace("-","");

    @ApiOperation(value = "登陆")
    @PostMapping(value = "/login")
    public LoginResponse login(@RequestBody LoginRequest loginRequest){
        LoginResponse response = new LoginResponse();
        if (StringUtils.isEmpty(loginRequest.getUsername()) ||
            StringUtils.isEmpty(loginRequest.getPassword())){
            response.setSuccess(false);
            response.setMessage("用户名密码参数错误");
            return response;
        }
        if (loginRequest.getUsername().equals("admin") && loginRequest.getPassword().equals("123456")){
            response.setSuccess(true);
            response.setToken(TOKEN);
            return response;
        }
        response.setSuccess(false);
        response.setMessage("用户名或者密码错误");
        return response;
    }
}
