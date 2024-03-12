package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.Consumer;
import com.ssm.maven.core.entity.User;

/**
 * @Author cccc
 * @Date 2024/03/06 11:36
 **/
public interface MallUserDao {
    Consumer findUserByName(String username);

    int insertConsumer(Consumer consumer);

    Consumer findUserBUAP(String username, String password);
}
