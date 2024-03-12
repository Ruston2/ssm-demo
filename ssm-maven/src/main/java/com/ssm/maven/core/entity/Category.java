package com.ssm.maven.core.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author cccc
 * @Date 2024/02/28 15:23
 **/
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Category {
    private String cid;
    private String cname;
}
