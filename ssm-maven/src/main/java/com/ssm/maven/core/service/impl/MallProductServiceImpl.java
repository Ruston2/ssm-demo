package com.ssm.maven.core.service.impl;

import com.ssm.maven.core.dao.MallProductDao;
import com.ssm.maven.core.entity.Favorite;
import com.ssm.maven.core.service.MallProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author cccc
 * @Date 2024/03/07 17:15
 **/
@Service
public class MallProductServiceImpl implements MallProductService {

    @Autowired
    private MallProductDao mallProductDao;

    @Override
    public Favorite findFavoriteByUid(int uid) {
        return mallProductDao.findFavoriteByUid(uid);
    }
}
