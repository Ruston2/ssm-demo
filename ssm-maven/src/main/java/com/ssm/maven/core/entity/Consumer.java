package com.ssm.maven.core.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author cccc
 * @Date 2024/03/06 11:38
 **/
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Consumer {
    private int id;
    private String username;
    private String password;

    private String email;
    private String name;
    private int isDelete;
}
