package com.ssm.maven.core.service;

import com.ssm.maven.core.entity.Consumer;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/06 11:45
 **/
public interface MallUserService {
    public Consumer findByUsername(String username);

    int insertConsumer(Consumer consumer);

    Consumer findByUAndP(String username, String password);

    List<Consumer> listUser(Map<String, Object> map);

    Long getTotalConsumer(Map<String, Object> map);

    int deleteById(int id);

    int updateConsumer(Consumer consumer);
}

