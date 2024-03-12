package com.ssm.maven.core.service.impl;

import com.ssm.maven.core.dao.StatisticsDao;
import com.ssm.maven.core.entity.dto.ProductCategoryDto;
import com.ssm.maven.core.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/04 16:55
 **/
@Service
public class StatisticsServiceImpl implements StatisticsService {

    @Autowired
    private StatisticsDao statisticsDao;

    @Override
    public List<ProductCategoryDto> getProductCategory() {
        return statisticsDao.getProductCategory();
    }
}
