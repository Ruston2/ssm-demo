package com.ssm.maven.core.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

/**
 * @Author cccc
 * @Date 2024/03/07 16:43
 **/
@Data
@AllArgsConstructor
@ToString
public class Favorite {

    private int uid;
    private String favoriteItems;

}
