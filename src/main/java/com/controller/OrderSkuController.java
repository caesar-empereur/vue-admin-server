package com.controller;

import cn.hutool.core.bean.BeanUtil;
import com.model.Order;
import com.model.Sku;
import com.repository.OrderRepository;
import com.repository.SkuRepository;
import com.vo.OrderPageQueryParameter;
import com.vo.SkuPageQueryParameter;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.aspectj.weaver.ast.Or;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description
 * @author: yangyingyang
 * @date: 2020/5/6.
 */
@Api(description = "订单商品接口")
@RestController
@RequestMapping(value = "/order-sku")
public class OrderSkuController {

    @Resource
    private OrderRepository orderRepository;

    @Resource
    private SkuRepository skuRepository;

    @ApiOperation(value = "订单分页查询")
    @GetMapping("/order/page")
    public Page<Order> orderPage(@ModelAttribute OrderPageQueryParameter parameter){
        if (StringUtils.isEmpty(parameter.getOrderNo())){
            parameter.setOrderNo(null);
        }
//        return orderRepository.pageQuery(BeanUtil.copyProperties(parameter, Order.class),
//                                         parameter.getPageNo(), parameter.getPageSize());

        Specification<Order> specEqual = orderRepository.buildSpecEqual(BeanUtil.copyProperties(parameter, Order.class));
        Specification<Order> specTime = orderRepository.buildTimeParamSpec("createTime", "2023-10-10 16:56:06", "2023-10-14 16:56:06");
        return orderRepository.findAll(specEqual.and(specTime), PageRequest.of(parameter.getPageNo()-1,
                                                                               parameter.getPageSize()));
    }

    @ApiOperation(value = "订单分页查询")
    @GetMapping("/sku/page")
    public Page<Sku> skuPage(@ModelAttribute SkuPageQueryParameter parameter){
        if (StringUtils.isEmpty(parameter.getName())){
            parameter.setName(null);
        }
        return skuRepository.pageQuery(BeanUtil.toBean(parameter, Sku.class), parameter.getPageNo(),
                                       parameter.getPageSize());
    }

    @ApiOperation(value = "新增Sku")
    @PostMapping(value = "/sku/save")
    public void skuSave(@RequestBody Sku sku){
        sku.setCreateTime(new Date());
        skuRepository.save(sku);
    }

    @ApiOperation(value = "创建订单")
    @PostMapping(value = "/order/save")
    public void orderSave(@RequestBody Order order){
        order.setCreateTime(new Date());
        orderRepository.save(order);
    }

}
