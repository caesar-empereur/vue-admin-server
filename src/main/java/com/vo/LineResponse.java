package com.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * @Description
 * @author: yangyingyang
 * @date: 2020/5/11.
 */
@Data
@AllArgsConstructor
public class LineResponse implements Serializable {

    private Integer indexCount;

    private Integer sellCount;

    private Integer secCount;

    private Long currTime;

}
