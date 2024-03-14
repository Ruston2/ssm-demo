package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.Comment;

import java.util.HashMap;
import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/12 16:05
 **/

public interface CommentDao {

    int insertComment(Comment comment);

    List<Comment> getComments(HashMap<String, Object> map);
}
