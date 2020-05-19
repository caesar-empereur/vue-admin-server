package com.controller;

import com.vo.LineResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Random;

/**
 * @Description
 * @author: yangyingyang
 * @date: 2020/5/11.
 */
@Api(description = "图表接口")
@RestController
@RequestMapping(value = "/echart")
public class EchartDataController {

    private static final Random random = new Random();

    private static Integer days = 0;

//    @ApiOperation(value = "曲线")
//    @GetMapping(value = "/line")
//    public LineResponse mysqlLine(){
//        return newResponse();
//    }

    public static LineResponse newResponse(Long second){
        return new LineResponse(randomInteger(), randomInteger(), randomInteger(), second);
    }

    private static Integer randomInteger(){
        return randomInteger(200, 500);
    }

    private static Integer randomInteger(Integer min, Integer max){
        return random.nextInt(max-min+1)+min;
    }
}
