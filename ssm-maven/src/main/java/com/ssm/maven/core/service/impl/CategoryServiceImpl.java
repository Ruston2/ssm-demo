package com.ssm.maven.core.service.impl;

import com.ssm.maven.core.dao.CategoryDao;
import com.ssm.maven.core.entity.Article;
import com.ssm.maven.core.entity.Category;
import com.ssm.maven.core.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/04 11:23
 **/
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDao categoryDao;

    @Override
    public List<Article> getCategories(Map<String, Object> map) {
        return categoryDao.getCategories(map);
    }

    @Override
    public Long getTotalCategories(Map<String, Object> map) {
        return categoryDao.getTotalCategories(map);
    }

    @Override
    public int saveCategory(Category category) {
        return categoryDao.saveCategory(category);
    }

    @Override
    public Category selectByCid(String cid) {
        return categoryDao.selectByCid(cid);
    }

    @Override
    public int modifyCategory(Category category) {
        return categoryDao.modifyCategory(category);
    }

    @Override
    public void deleteCategory(String s) {
        categoryDao.deleteCategory(s);
    }
}
