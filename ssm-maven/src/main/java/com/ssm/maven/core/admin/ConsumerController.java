package com.ssm.maven.core.admin;

import com.ssm.maven.core.entity.Consumer;
import com.ssm.maven.core.entity.PageBean;
import com.ssm.maven.core.entity.User;
import com.ssm.maven.core.service.MallUserService;
import com.ssm.maven.core.util.MD5Util;
import com.ssm.maven.core.util.ResponseUtil;
import com.ssm.maven.core.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author cccc
 * @Date 2024/03/14 16:27
 **/
@Controller
@RequestMapping("/consumer")
public class ConsumerController {
    @Autowired
    private MallUserService mallUserService;


    @RequestMapping("/listConsumer")
    public String listConsumer(@RequestParam(value = "page", required = false) String page,
                               @RequestParam(value = "rows",required = false) String rows,
                               Consumer consumer, HttpServletResponse response) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        if (page != null && rows != null) {
            PageBean pageBean = new PageBean(Integer.parseInt(page),
                    Integer.parseInt(rows));
            map.put("start", pageBean.getStart());
            map.put("size", pageBean.getPageSize());
        }
        map.put("username", StringUtil.formatLike(consumer.getUsername()));
        List<Consumer> consumerList = mallUserService.listUser(map);
        Long total = mallUserService.getTotalConsumer(map);
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(consumerList);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);

        return null;
    }

    @RequestMapping("/delete")
    public String deleteById(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            mallUserService.deleteById(Integer.parseInt(idsStr[i]));
        }
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/save")
    public String save(Consumer consumer, HttpServletResponse response) throws Exception {
        int resultTotal = 0;
        if (consumer.getId() > 0) {
            resultTotal = mallUserService.updateConsumer(consumer);
        } else {
            resultTotal = mallUserService.insertConsumer(consumer);
        }
        JSONObject result = new JSONObject();
        if (resultTotal > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }


}
