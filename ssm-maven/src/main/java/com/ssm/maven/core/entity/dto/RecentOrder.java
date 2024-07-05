package com.ssm.maven.core.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author cccc
 * @Date 2024/03/20 14:47
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RecentOrder {
    private String orders;
    private String createTime;
}