package com.ssm.maven.core.service.impl;

import com.ssm.maven.core.dao.ProductDao;
import com.ssm.maven.core.entity.Book;
import com.ssm.maven.core.entity.Category;
import com.ssm.maven.core.entity.Product;
import com.ssm.maven.core.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/02/27 15:59
 **/
@Service("productService")
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductDao productDao;
    @Override
    public List<Product> findProducts(Map<String, Object> map) {
        return productDao.findProducts(map);
    }

    @Override
    public Long getTotleProducts(Map<String, Object> map) {
        return productDao.getTotleProducts(map);
    }

    @Override
    public String findCategory(String cid) {
        return productDao.findCategory(cid);
    }

    @Override
    public List<Category> getAllCategories() {
        return productDao.getAllCategories();
    }

    @Override
    public void deleteProduct(int pid) {
        productDao.deleteProduct(pid);
    }

    @Override
    public int insertProduct(Product product) {
        return productDao.insertProduct(product);
    }

    @Override
    public int updateProduct(Product product) {
        return productDao.updateProduct(product);
    }

    @Override
    public int updateProduct1(Product product) {
        return productDao.updateProduct1(product);
    }
}
