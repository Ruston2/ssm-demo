package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.dto.ProductCategoryDto;

import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/04 16:44
 **/
public interface StatisticsDao {

    public List<ProductCategoryDto> getProductCategory();

}
