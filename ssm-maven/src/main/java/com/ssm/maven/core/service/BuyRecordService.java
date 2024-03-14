package com.ssm.maven.core.service;

import com.ssm.maven.core.entity.BuyRecord;

/**
 * @Author cccc
 * @Date 2024/03/11 15:24
 **/
public interface BuyRecordService {
    int createBuyRecord(BuyRecord buyRecord);

    int deleteById(int id);
}
