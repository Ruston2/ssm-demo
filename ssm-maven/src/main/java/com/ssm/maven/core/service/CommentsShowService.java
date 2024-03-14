package com.ssm.maven.core.service;

import com.ssm.maven.core.entity.dto.CommentsShowDto;

import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/12 17:14
 **/
public interface CommentsShowService {
    List<CommentsShowDto> getCommentsShow(String pid);
}
