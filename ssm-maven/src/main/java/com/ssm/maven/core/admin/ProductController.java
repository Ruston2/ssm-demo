package com.ssm.maven.core.admin;

import com.ssm.maven.core.entity.Book;
import com.ssm.maven.core.entity.Category;
import com.ssm.maven.core.entity.PageBean;
import com.ssm.maven.core.entity.Product;
import com.ssm.maven.core.service.ProductService;
import com.ssm.maven.core.service.impl.BookServiceImpl;
import com.ssm.maven.core.util.ResponseUtil;
import com.ssm.maven.core.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @Author cccc
 * @Date 2024/02/27 16:02
 **/
@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    private static final Logger log = Logger.getLogger(BookServiceImpl.class);

    @RequestMapping("/findProducts")
    public String findProducts(
            @RequestParam(value = "page", required = false) String page,
            @RequestParam(value = "rows", required = false) String rows,
            @RequestParam(value = "success", required = false) String success,
            Product product, HttpServletResponse response) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        if (page != null && rows != null) {
            PageBean pageBean = new PageBean(Integer.parseInt(page),
                    Integer.parseInt(rows));
            map.put("start", pageBean.getStart());
            map.put("size", pageBean.getPageSize());
        }
        List<Product> products = null;
        Long total = 0L;
        if (product.getPname() != null &&
                !"".equals(product.getPname())) {
            map.put("pname", StringUtil.formatLike(product.getPname()));
        }
        products = productService.findProducts(map);
        total = productService.getTotleProducts(map);
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(products);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        log.info("request: product/findProducts , map: " + map.toString());
        return null;
    }

    @RequestMapping("/findCategory")
    public String findCategory(@RequestParam(value = "cid") String cid,
                               HttpServletResponse response) throws Exception {
        String category = productService.findCategory(String.valueOf(cid));
        JSONObject result = new JSONObject();

        result.put("category", category);
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/getAllCategories")
    public String getAllCategories(HttpServletResponse response) throws Exception{
        List<Category> allCategories = productService.getAllCategories();
        List<String> categoryName = new ArrayList<>();
        allCategories.stream().forEach(c->categoryName.add("\""+c.getCname()+"\""));
        JSONObject result = new JSONObject();
        result.put("categoryName",categoryName);
        ResponseUtil.write(response,categoryName);
        return null;
    }


    @RequestMapping("/deleteProduct")
    public String deleteProduct(@RequestParam(value = "ids") String ids,HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            productService.deleteProduct(Integer.parseInt(idsStr[i]));
        }
        result.put("success", true);
        ResponseUtil.write(response, result);
        log.info("request: product/delete , ids: " + ids);
        return null;
    }

    @RequestMapping("/clickItem")
    public String clickItem(String pname,  HttpSession session){
        HashMap<String, Object> map = new HashMap<>(1);
        map.put("pname", StringUtil.formatLike(pname));
        List<Product> products = productService.findProducts(map);
        session.setAttribute("p",products.get(0));
        return "redirect:/mall/product_info.jsp";
    }

    @RequestMapping("/clickItemById")
    public String clickItemById(String pid,  HttpSession session){
        HashMap<String, Object> map = new HashMap<>(1);
        map.put("pid", pid);
        List<Product> products = productService.findProducts(map);
        session.setAttribute("p",products.get(0));
        return "redirect:/mall/product_info.jsp";
    }




}
