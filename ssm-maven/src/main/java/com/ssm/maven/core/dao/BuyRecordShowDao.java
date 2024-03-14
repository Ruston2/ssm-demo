package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.dto.BuyRecordShowDto;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/13 17:18
 **/
public interface BuyRecordShowDao {
    List<BuyRecordShowDto> findBuyRecords(Map<String, Object> map);

    int findTotal(Map<String, Object> map);
}
