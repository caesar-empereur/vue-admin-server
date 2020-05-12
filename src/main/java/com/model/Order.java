package com.model;

import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * @Description
 * @author: yangyingyang
 * @date: 2020/5/6.
 */
@Data
@Entity
@Table(name = "t_order")
@DynamicInsert
@DynamicUpdate
public class Order implements Serializable {

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(length = 36)
    private String id;

    private String orderNo;

    private String buyerName;

    private String sellerName;

    private String skuId;

    private String skuName;

    private Integer amount;

    private String status;

    private Date createTime;
}
