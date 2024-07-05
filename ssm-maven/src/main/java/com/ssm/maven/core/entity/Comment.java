package com.ssm.maven.core.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author cccc
 * @Date 2024/03/07 16:45
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Comment {
    private int pid;
    private String comment;
    private int uid;
    private String createTime;

}