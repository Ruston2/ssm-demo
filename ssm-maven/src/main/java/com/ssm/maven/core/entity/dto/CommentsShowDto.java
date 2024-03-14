package com.ssm.maven.core.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author cccc
 * @Date 2024/03/12 17:06
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CommentsShowDto {
    private String name;
    private String message;
    private String time;
}
