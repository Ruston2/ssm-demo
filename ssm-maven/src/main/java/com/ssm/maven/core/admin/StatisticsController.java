package com.ssm.maven.core.admin;

import com.ssm.maven.core.entity.dto.CategorySold;
import com.ssm.maven.core.entity.dto.ProductCategoryDto;
import com.ssm.maven.core.entity.dto.RecentOrder;
import com.ssm.maven.core.service.OrderService;
import com.ssm.maven.core.service.StatisticsService;
import com.ssm.maven.core.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @Author cccc
 * @Date 2024/03/04 16:41
 **/
@Controller
@RequestMapping("/statistics")
public class StatisticsController {

    @Autowired
    private StatisticsService statisticsService;
    @Autowired
    private OrderService orderService;

    @RequestMapping("/getProductCategory")
    public String getProductCategory(HttpServletResponse response) throws Exception {
        List<ProductCategoryDto> productCategory = statisticsService.getProductCategory();
        List<CategorySold> categorySold = statisticsService.getCategorySold();
        JSONObject result = new JSONObject();
        ArrayList<String> cnames = new ArrayList<>();
        ArrayList<Integer> nums = new ArrayList<>();
        ArrayList<String> soldNums = new ArrayList<>();
        productCategory.stream().forEach(s->{
            cnames.add(s.getCname());
            nums.add(s.getNum());
        });
        for (String cname : cnames) {
            boolean flag = false;
            for (CategorySold sold : categorySold) {
                if (sold.getCname().equals(cname)){
                    flag=true;
                    soldNums.add(sold.getNum());
                    break;
                }
            }
            if(!flag){
                soldNums.add("0");
            }
        }

        JSONArray cname = JSONArray.fromObject(cnames);
        JSONArray num = JSONArray.fromObject(nums);
        JSONArray soldNum = JSONArray.fromObject(soldNums);
        result.put("cname", cname);
        result.put("num", num);
        result.put("soldNum",soldNum);
        ResponseUtil.write(response, result);
        System.out.println(productCategory);
        return null;
    }

    @RequestMapping("/getCategorySold")
    public String getCategorySold(HttpServletResponse response) throws Exception{
        List<CategorySold> categorySold = statisticsService.getCategorySold();
        JSONObject result = new JSONObject();
        ArrayList<String> cnames = new ArrayList<>();
        ArrayList<String> nums = new ArrayList<>();
        categorySold.stream().forEach(s->{
            cnames.add(s.getCname());
            nums.add(s.getNum());
        });
        JSONArray cname = JSONArray.fromObject(cnames);
        JSONArray num = JSONArray.fromObject(nums);
        result.put("cname", cname);
        result.put("num", num);
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/recentSalesRevenue")
    public String getSalesRevenue(HttpServletResponse response) throws Exception{
        List<RecentOrder> recentOrders = statisticsService.getSalesRevenue();
        HashMap<String, Double> revenue = new HashMap<>();
        for (RecentOrder recentOrder : recentOrders) {
            List<String> list = Arrays.stream(recentOrder.getOrders().split(",")).collect(Collectors.toList());
            Double total = orderService.selectTotalOrderIds(list);
            if(!revenue.containsKey(recentOrder.getCreateTime())){
                revenue.put(recentOrder.getCreateTime(),total);
            }else{
                revenue.put(recentOrder.getCreateTime(),revenue.get(recentOrder.getCreateTime())+total);
            }
        }

        HashMap<String, Double> map = new HashMap<>();
        LocalDate endDate = LocalDate.parse(LocalDate.now().toString());
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        for (int i = 0; i <= 7; i++) {
            LocalDate date = endDate.minusDays(i);
            map.put(date.format(formatter),0.0);
        }
        for (String s : map.keySet()) {
            if(!revenue.containsKey(s)){
                revenue.put(s,0.0);
            }
        }
        TreeMap<String, Double> result = new TreeMap<>();
        for (int i = 7; i >=0; i--) {
            LocalDate date = endDate.minusDays(i);
            result.put(date.format(formatter),0.0);
        }
        for (String s : revenue.keySet()) {
            if(result.containsKey(s)){
                result.put(s,revenue.get(s));
            }
        }





        JSONObject re = new JSONObject();
        JSONArray time = JSONArray.fromObject(new ArrayList<>(result.keySet()));
        JSONArray sum = JSONArray.fromObject(new ArrayList<>(result.values()));
        re.put("time", time);
        re.put("sum", sum);
        ResponseUtil.write(response, re);

        return null;
    }
}
