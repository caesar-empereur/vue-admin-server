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
@Table(name = "t_sku")
@DynamicInsert
@DynamicUpdate
public class Sku implements Serializable{

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(length = 36)
    private String id;

    private String name;

    private Integer price;

    private String spec;

    private Integer shipFee;

    private Integer count;

    private String imageUrl;

    private Date createTime;
}
