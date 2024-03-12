package com.ssm.maven.core.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author cccc
 * @Date 2024/03/11 15:16
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BuyRecord {
    private int id;
    private String orders;
    private String createTime;
}
