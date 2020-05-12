package com.vo;

import lombok.Data;

/**
 * @Description
 * @author: yangyingyang
 * @date: 2020/5/6.
 */
@Data
public class OrderPageQueryParameter extends PageParameter {

    private String orderNo;

    private String status;

}
