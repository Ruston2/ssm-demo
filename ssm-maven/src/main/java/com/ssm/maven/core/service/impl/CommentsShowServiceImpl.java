package com.ssm.maven.core.service.impl;

import com.ssm.maven.core.dao.CommentsShowDao;
import com.ssm.maven.core.entity.dto.CommentsShowDto;
import com.ssm.maven.core.service.CommentsShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/12 17:14
 **/
@Service
public class CommentsShowServiceImpl implements CommentsShowService {
    @Autowired
    private CommentsShowDao commentsShowDao;

    @Override
    public List<CommentsShowDto> getCommentsShow(String pid) {
        return commentsShowDao.getCommentsShow(pid);
    }
}
