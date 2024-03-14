package com.ssm.maven.core.service.impl;

import com.ssm.maven.core.dao.BuyRecordShowDao;
import com.ssm.maven.core.entity.dto.BuyRecordShowDto;
import com.ssm.maven.core.service.BuyRecordShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/13 17:21
 **/
@Service
public class BuyRecordShowServiceImpl implements BuyRecordShowService {
    @Autowired
    private BuyRecordShowDao buyRecordShowDao;

    @Override
    public List<BuyRecordShowDto> findBuyRecords(Map<String, Object> map) {
        return buyRecordShowDao.findBuyRecords(map);
    }

    @Override
    public int findTotal(Map<String, Object> map) {
        return buyRecordShowDao.findTotal(map);
    }
}
