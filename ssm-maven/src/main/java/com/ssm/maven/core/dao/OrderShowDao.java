package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.dto.OrderShowDto;

import java.util.HashMap;
import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/11 10:56
 **/
public interface OrderShowDao {
    List<OrderShowDto> listOrders(HashMap<String,Object> map);
}
