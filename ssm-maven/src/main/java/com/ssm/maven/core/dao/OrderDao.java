package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.Order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/10 15:59
 **/
public interface OrderDao {

    public int insertOrder(Order order);

    List<Order> listOrders(Map<String, Object> map);

    int updateOrder(Order order);

    int deleteOrderById(String orderId);

    int buyProduct(String id);

    List<Order> listOrder(HashMap<String, Object> map);

    List<Order> selectByOrderIds(List<String> orderIds);
}
