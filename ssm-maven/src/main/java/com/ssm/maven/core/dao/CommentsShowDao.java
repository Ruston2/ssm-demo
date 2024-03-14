package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.dto.CommentsShowDto;

import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/12 17:12
 **/
public interface CommentsShowDao {

    List<CommentsShowDto> getCommentsShow(String pid);
}
