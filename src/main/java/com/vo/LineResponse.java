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

    private Integer queryTime;

    private Integer dealTime;

    private Integer resTime;

    private LocalDate date;

}
