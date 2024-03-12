package com.ssm.maven.core.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author cccc
 * @Date 2024/03/04 16:19
 **/
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ProductCategoryDto {
    /**
      * ProductCategoryDto
      * 种类名称
      * @Author 龚睿
      * @Date 2024/3/4
      */
    private String cname;
    /**
      * ProductCategoryDto
      * 种类数量
      * @Author 龚睿
      * @Date 2024/3/4
      */
    private int num;
}
