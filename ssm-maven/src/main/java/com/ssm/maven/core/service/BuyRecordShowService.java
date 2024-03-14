package com.ssm.maven.core.service;

import com.ssm.maven.core.entity.dto.BuyRecordShowDto;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/13 17:20
 **/
public interface BuyRecordShowService {
    List<BuyRecordShowDto> findBuyRecords(Map<String, Object> map);

    int findTotal(Map<String, Object> map);
}
