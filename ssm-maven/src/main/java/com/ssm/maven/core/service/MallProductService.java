package com.ssm.maven.core.service;

import com.ssm.maven.core.entity.Favorite;

/**
 * @Author cccc
 * @Date 2024/03/07 17:14
 **/
public interface MallProductService {
    public Favorite findFavoriteByUid(int uid);
}
