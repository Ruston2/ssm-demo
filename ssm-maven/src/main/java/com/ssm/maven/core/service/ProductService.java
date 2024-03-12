package com.ssm.maven.core.service;

import com.ssm.maven.core.entity.Book;
import com.ssm.maven.core.entity.Category;
import com.ssm.maven.core.entity.Product;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/02/27 15:58
 **/
public interface ProductService {

    public List<Product> findProducts(Map<String, Object> map);

    public Long getTotleProducts(Map<String,Object> map);

    public String findCategory(String cid);

    List<Category> getAllCategories();

    void deleteProduct(int pid);
}
