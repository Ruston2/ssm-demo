package com.ssm.maven.core.service.impl;

import com.ssm.maven.core.dao.OrderDao;
import com.ssm.maven.core.entity.Order;
import com.ssm.maven.core.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/10 15:59
 **/
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public int insertOrder(Order order) {
        return orderDao.insertOrder(order);
    }

    @Override
    public List<Order> listOrders(Map<String, Object> map) {
        return orderDao.listOrders(map);
    }

    @Override
    public int updateOrder(Order order) {
        return orderDao.updateOrder(order);
    }

    @Override
    public int deleteOrderById(String orderId) {
        return orderDao.deleteOrderById(orderId);
    }

    @Override
    public int buyProduct(String id) {
        return orderDao.buyProduct(id);
    }
}
