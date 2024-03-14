package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.Consumer;
import com.ssm.maven.core.entity.User;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/06 11:36
 **/
public interface MallUserDao {
    Consumer findUserByName(String username);

    int insertConsumer(Consumer consumer);

    Consumer findUserBUAP(String username, String password);

    List<Consumer> listConsumer(Map<String, Object> map);

    Long getTotalConsumer(Map<String, Object> map);

    int deleteById(int id);

    int updateConsumer(Consumer consumer);
}
