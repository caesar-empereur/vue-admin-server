package com.vo;

import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * @Description
 * @author: yangyingyang
 * @date: 2018/11/27.
 */
@ApiModel(description = "分页查询参数")
@Data
public class PageParameter {
    
    private Integer pageSize = 10;
    
    private Integer pageNo = 1;
}
