package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.Comment;
import com.ssm.maven.core.entity.dto.CommentShowDto;

import java.util.HashMap;
import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/12 16:05
 **/

public interface CommentDao {

    int insertComment(Comment comment);

    List<Comment> getComments(HashMap<String, Object> map);

    int deleteComment(String id);

    int modifyComment(CommentShowDto comment);
}
