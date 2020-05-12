package com.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Description
 * @author: yangyingyang
 * @date: 2020/5/11.
 */
@Data
public class LoginResponse implements Serializable {

    private Boolean success;

    private String token;

    private String message;
}
