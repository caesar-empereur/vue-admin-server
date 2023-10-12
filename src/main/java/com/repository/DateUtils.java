package com.repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * @Description
 * @author: yangyingyang
 * @date: 2023/10/12.
 */
public class DateUtils {

    public static Date parseToDate(String time) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return simpleDateFormat.parse(time);
        }
        catch (ParseException e) {
            e.printStackTrace();
            throw new RuntimeException("日期错误");
        }
    }

    public static LocalDateTime parse(String time) {
        return LocalDateTime.parse(time, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }
}
