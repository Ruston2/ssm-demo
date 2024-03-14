package com.ssm.maven.core.service;

import com.ssm.maven.core.dao.OrderShowDao;
import com.ssm.maven.core.entity.dto.OrderShowDto;

import java.util.HashMap;
import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/11 11:09
 **/
public interface OrderShowService {
    List<OrderShowDto> listOrders(HashMap<String,Object> map);

    List<OrderShowDto> listOrder(HashMap<String, Object> map);
}
