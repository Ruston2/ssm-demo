package com.ssm.maven.core.dao;

import com.ssm.maven.core.entity.Category;
import com.ssm.maven.core.entity.Product;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/02/27 15:43
 **/
@Repository
public interface ProductDao {

    public List<Product> findProducts(Map<String, Object> map);

    public Long getTotleProducts(Map<String,Object> map);

    public String findCategory(String cid);

    List<Category> getAllCategories();

    void deleteProduct(int pid);

    int insertProduct(Product product);

    int updateProduct(Product product);

    int updateProduct1(Product product);
}
