package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.BuyRecord;

/**
 * @Author cccc
 * @Date 2024/03/11 15:19
 **/
public interface BuyRecordDao {
    int createBuyRecord(BuyRecord buyRecord);

    int deleteById(int id);
}
