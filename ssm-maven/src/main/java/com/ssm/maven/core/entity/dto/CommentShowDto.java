package com.ssm.maven.core.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author cccc
 * @Date 2024/03/17 10:58
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CommentShowDto {
    private String id;
    private String username;
    private String pname;
    private String comment;
    private String createTime;
}
