package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.Product;
import com.ssm.maven.core.entity.dto.CommentShowDto;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/17 11:02
 **/
public interface CommentShowDao {
    List<CommentShowDto> findComments(Map<String, Object> map);

    Long getTotalComments(Map<String, Object> map);
}
