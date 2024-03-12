package com.ssm.maven.core.service.impl;

import com.ssm.maven.core.dao.BuyRecordDao;
import com.ssm.maven.core.entity.BuyRecord;
import com.ssm.maven.core.service.BuyRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author cccc
 * @Date 2024/03/11 15:25
 **/
@Service
public class BuyRecordServiceImpl implements BuyRecordService {

    @Autowired
    private BuyRecordDao buyRecordDao;

    @Override
    public int createBuyRecord(BuyRecord buyRecord) {
        return buyRecordDao.createBuyRecord(buyRecord);
    }
}
