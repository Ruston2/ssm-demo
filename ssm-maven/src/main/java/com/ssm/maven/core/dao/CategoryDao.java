package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.Article;
import com.ssm.maven.core.entity.Category;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/04 11:24
 **/
public interface CategoryDao {

    public List<Article> getCategories(Map<String, Object> map);

    public Long getTotalCategories(Map<String,Object> map);

    int saveCategory(Category category);

    Category selectByCid(String cid);

    int modifyCategory(Category category);

    void deleteCategory(String s);
}
