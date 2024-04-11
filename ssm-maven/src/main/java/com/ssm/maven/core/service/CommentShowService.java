package com.ssm.maven.core.service;

import com.ssm.maven.core.entity.Product;
import com.ssm.maven.core.entity.dto.CommentShowDto;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/17 11:07
 **/
public interface CommentShowService {
    List<CommentShowDto> findComments(Map<String, Object> map);

    Long getTotleComments(Map<String, Object> map);
}
