package com.ssm.maven.core.service.impl;

import com.ssm.maven.core.dao.MallUserDao;
import com.ssm.maven.core.entity.Consumer;
import com.ssm.maven.core.service.MallUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @Author cccc
 * @Date 2024/03/06 11:46
 **/
@Service
public class MallUserServiceImpl implements MallUserService {

    @Autowired
    private MallUserDao mallUserDao;
    @Override
    public Consumer findByUsername(String username) {
        return mallUserDao.findUserByName(username);
    }

    @Override
    public int insertConsumer(Consumer consumer) {
        return mallUserDao.insertConsumer(consumer);
    }

    @Override
    public Consumer findByUAndP(String username, String password) {
        return mallUserDao.findUserBUAP(username,password);
    }

    @Override
    public List<Consumer> listUser(Map<String, Object> map) {
        return mallUserDao.listConsumer(map);
    }

    @Override
    public Long getTotalConsumer(Map<String, Object> map) {
        return mallUserDao.getTotalConsumer(map);
    }

    @Override
    public int deleteById(int id) {
        return mallUserDao.deleteById(id);
    }

    @Override
    public int updateConsumer(Consumer consumer) {
        return mallUserDao.updateConsumer(consumer);
    }
}
