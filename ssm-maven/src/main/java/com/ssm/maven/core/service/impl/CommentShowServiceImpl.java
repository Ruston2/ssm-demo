package com.ssm.maven.core.service.impl;

import com.ssm.maven.core.dao.CommentShowDao;
import com.ssm.maven.core.entity.Product;
import com.ssm.maven.core.entity.dto.CommentShowDto;
import com.ssm.maven.core.service.CommentShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/17 11:07
 **/
@Service
public class CommentShowServiceImpl implements CommentShowService {
    @Autowired
    private CommentShowDao commentShowDao;

    @Override
    public List<CommentShowDto> findComments(Map<String, Object> map) {
        return commentShowDao.findComments(map);
    }

    @Override
    public Long getTotleComments(Map<String, Object> map) {
        return commentShowDao.getTotalComments(map);
    }
}
