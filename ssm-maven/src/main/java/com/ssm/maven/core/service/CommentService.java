package com.ssm.maven.core.service;

import com.ssm.maven.core.entity.Comment;
import org.springframework.stereotype.Service;

/**
 * @Author cccc
 * @Date 2024/03/12 16:07
 **/
public interface CommentService {
    int insertComment(Comment comment);
}
