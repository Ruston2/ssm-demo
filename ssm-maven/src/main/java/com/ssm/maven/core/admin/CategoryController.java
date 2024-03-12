package com.ssm.maven.core.admin;

import com.ssm.maven.core.dao.CategoryDao;
import com.ssm.maven.core.entity.Article;
import com.ssm.maven.core.entity.Category;
import com.ssm.maven.core.entity.PageBean;
import com.ssm.maven.core.service.CategoryService;
import com.ssm.maven.core.util.DateUtil;
import com.ssm.maven.core.util.ResponseUtil;
import com.ssm.maven.core.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.beans.Introspector;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/04 11:18
 **/
@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/getCategories")
    public String getCategories(@RequestParam(value = "page", required = false) String page,
                                @RequestParam(value = "rows", required = false) String rows,
                                Category category,
                                HttpServletResponse response) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>(1);
        if (page != null && rows != null) {
            PageBean pageBean = new PageBean(Integer.parseInt(page),
                    Integer.parseInt(rows));
            map.put("start", pageBean.getStart());
            map.put("size", pageBean.getPageSize());
        }
        if (category != null) {
            map.put("cname",
                    StringUtil.formatLike(category.getCname()));
        }
        List<Article> productList = categoryService.getCategories(map);
        Long total = categoryService.getTotalCategories(map);
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(productList);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/saveCategory")
    public String saveCategory(Category category, HttpServletResponse response) throws Exception{
        int resultTotal = 0;
        Category category1 = categoryService.selectByCid(category.getCid());
        JSONObject result = new JSONObject();
        if(category1!=null){
            result.put("success",false);
            ResponseUtil.write(response, result);
            return null;
        }else {
            int i = categoryService.saveCategory(category);
            resultTotal=i;
        }


        if (resultTotal > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/modifyCategory")
    public String modifyCategory(Category category, HttpServletResponse response) throws Exception{
        int resultTotal = 0;
        JSONObject result = new JSONObject();

        int i = categoryService.modifyCategory(category);
        resultTotal=i;
        if (resultTotal > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/deleteCategory")
    public String deleteCategory(@RequestParam(value = "ids") String ids,
                                 HttpServletResponse response) throws Exception{
        JSONObject result = new JSONObject();
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            categoryService.deleteCategory(idsStr[i]);
        }
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }
}
