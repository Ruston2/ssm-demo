package com.ssm.maven.core.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author cccc
 * @Date 2024/03/13 17:16
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BuyRecordShowDto {
    private int id;
    private String username;
    private String orders;
    private String createTime;
}
