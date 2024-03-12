package com.ssm.maven.core.admin;

import com.ssm.maven.core.entity.dto.ProductCategoryDto;
import com.ssm.maven.core.service.StatisticsService;
import com.ssm.maven.core.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/04 16:41
 **/
@Controller
@RequestMapping("/statistics")
public class StatisticsController {

    @Autowired
    private StatisticsService statisticsService;

    @RequestMapping("/getProductCategory")
    public String getProductCategory(HttpServletResponse response) throws Exception {
        List<ProductCategoryDto> productCategory = statisticsService.getProductCategory();
        JSONObject result = new JSONObject();
        ArrayList<String> cnames = new ArrayList<>();
        ArrayList<Integer> nums = new ArrayList<>();
        productCategory.stream().forEach(s->{
            cnames.add(s.getCname());
            nums.add(s.getNum());
        });

        JSONArray cname = JSONArray.fromObject(cnames);
        JSONArray num = JSONArray.fromObject(nums);
        result.put("cname", cname);
        result.put("num", num);
        ResponseUtil.write(response, result);
        System.out.println(productCategory);
        return null;
    }
}
