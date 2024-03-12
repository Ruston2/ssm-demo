package com.ssm.maven.core.service.impl;

import com.ssm.maven.core.dao.OrderShowDao;
import com.ssm.maven.core.entity.dto.OrderShowDto;
import com.ssm.maven.core.service.OrderShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/11 11:10
 **/
@Service
public class OrderShowServiceImpl implements OrderShowService {

    @Autowired
    private OrderShowDao orderShowDao;

    @Override
    public List<OrderShowDto> listOrders(HashMap<String, Object> map) {
        return orderShowDao.listOrders(map);
    }
}
