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
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
//        List<String> categoryName = new ArrayList<>();
//        allCategories.stream().forEach(c->categoryName.add("\""+c.getCname()+"\""));
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(allCategories);
        result.put("categoryName",jsonArray);
        ResponseUtil.write(response,jsonArray);
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

    @RequestMapping("/clickSubmit")
    public String clickSubmit(String pname,HttpSession session){
        session.setAttribute("itemName",pname);
        return "redirect:/mall/products.jsp";
    }

    @RequestMapping("/clickAll")
    public String clickAll(HttpSession session){
        session.setAttribute("itemName","");
        return "redirect:/mall/products.jsp";
    }

    @RequestMapping("/save")
    public String save(Product product, @RequestParam("image") MultipartFile file, HttpServletResponse response) throws Exception {
        Path path = Paths.get("/company/ssmshop/ssm-maven/src/main/webapp/products");
        String filename="";
        JSONObject result = new JSONObject();
        HashMap<String, Object> map = new HashMap<>();
        map.put("pname",product.getPname());
        List<Product> products = productService.findProducts(map);
        if(!products.isEmpty()){
            result.put("success", false);
            ResponseUtil.write(response, result);
            return null;
        }
        if (!file.isEmpty()) {
            try {
                // 如果目标文件夹不存在，就先创建
                if (!Files.exists(path)) {
                    Files.createDirectories(path);
                }
                // 将上传的文件保存在目标位置
                if(!path.resolve(file.getOriginalFilename()).toFile().exists()) {
                    file.transferTo(path.resolve(file.getOriginalFilename()).toFile());
                }
                filename = file.getOriginalFilename();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        if(StringUtils.isNotBlank(filename)){
            product.setPimage("/products/"+filename);
            int i = productService.insertProduct(product);
            if(i>0){
                result.put("success", true);
            }
            else{
                result.put("success",false);
            }
        }
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/update")
    public String update(Product product, @RequestParam("image") MultipartFile file, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        if(StringUtils.isNotBlank(product.getPid())){
            Path path = Paths.get("/company/ssmshop/ssm-maven/src/main/webapp/products");
            String filename="";
            int flag=0;
            if (!file.isEmpty()) {
                try {
                    // 如果目标文件夹不存在，就先创建
                    if (!Files.exists(path)) {
                        Files.createDirectories(path);
                    }
                    // 将上传的文件保存在目标位置
                    file.transferTo(path.resolve(file.getOriginalFilename()).toFile());
                    filename = file.getOriginalFilename();
                    product.setPimage("/products/"+filename);
                    flag = productService.updateProduct(product);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else{
                flag = productService.updateProduct1(product);
            }
            if(flag>0){
                result.put("success",true);
            }else{
                result.put("success",false);
            }
        }else {
            result.put("success",false);
        }
        ResponseUtil.write(response,result);
        return null;
    }




}
