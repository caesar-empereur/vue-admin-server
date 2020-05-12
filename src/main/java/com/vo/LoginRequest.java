package com.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Description
 * @author: yangyingyang
 * @date: 2020/5/11.
 */
@Data
public class LoginRequest implements Serializable {

    private String username;

    private String password;
}
