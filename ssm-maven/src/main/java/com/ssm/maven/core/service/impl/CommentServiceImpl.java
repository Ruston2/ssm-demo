package com.ssm.maven.core.service.impl;

import com.ssm.maven.core.dao.CommentDao;
import com.ssm.maven.core.entity.Comment;
import com.ssm.maven.core.entity.dto.CommentShowDto;
import com.ssm.maven.core.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/12 16:07
 **/
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;

    @Override
    public int insertComment(Comment comment) {
        return commentDao.insertComment(comment);
    }

    @Override
    public List<Comment> getComments(HashMap<String, Object> map) {
        return commentDao.getComments(map);
    }

    @Override
    public int deleteComment(String id) {
        return commentDao.deleteComment(id);
    }

    @Override
    public int modifyComment(CommentShowDto comment) {
        return commentDao.modifyComment(comment);
    }
}
