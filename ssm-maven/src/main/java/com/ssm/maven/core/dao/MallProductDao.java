package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.Favorite;

/**
 * @Author cccc
 * @Date 2024/03/07 17:10
 **/
public interface MallProductDao {

    public Favorite findFavoriteByUid(int uid);
}
