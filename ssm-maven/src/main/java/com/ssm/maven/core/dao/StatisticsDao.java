package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.dto.CategorySold;
import com.ssm.maven.core.entity.dto.ProductCategoryDto;
import com.ssm.maven.core.entity.dto.RecentOrder;

import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/04 16:44
 **/
public interface StatisticsDao {

    public List<ProductCategoryDto> getProductCategory();

    List<CategorySold> getCategorySold();

    List<RecentOrder> getSalesRevenue();
}
