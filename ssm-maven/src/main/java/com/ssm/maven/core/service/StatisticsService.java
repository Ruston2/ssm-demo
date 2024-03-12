package com.ssm.maven.core.service;

import com.ssm.maven.core.entity.dto.ProductCategoryDto;

import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/04 16:55
 **/
public interface StatisticsService {
    public List<ProductCategoryDto> getProductCategory();
}
