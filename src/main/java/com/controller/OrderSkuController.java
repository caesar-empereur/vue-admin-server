package com.controller;

import com.model.Order;
import com.model.Sku;
import com.repository.OrderRepository;
import com.repository.SkuRepository;
import com.vo.OrderPageQueryParameter;
import com.vo.SkuPageQueryParameter;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.data.domain.Page;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;

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
        return orderRepository.pageQuery(parameter);
    }

    @ApiOperation(value = "订单分页查询")
    @GetMapping("/sku/page")
    public Page<Sku> skuPage(@ModelAttribute SkuPageQueryParameter parameter){
        if (StringUtils.isEmpty(parameter.getName())){
            parameter.setName(null);
        }
        return skuRepository.pageQuery(parameter);
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
