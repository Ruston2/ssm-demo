package com.ssm.maven.core.admin;

import com.ssm.maven.core.entity.BuyRecord;
import com.ssm.maven.core.entity.Order;
import com.ssm.maven.core.entity.PageBean;
import com.ssm.maven.core.entity.Product;
import com.ssm.maven.core.entity.dto.BuyRecordShowDto;
import com.ssm.maven.core.service.BuyRecordService;
import com.ssm.maven.core.service.BuyRecordShowService;
import com.ssm.maven.core.service.OrderService;
import com.ssm.maven.core.util.ResponseUtil;
import com.ssm.maven.core.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
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
 * @Date 2024/03/11 15:57
 **/
@Controller
@RequestMapping("/buyRecord")
public class BuyRecordController {

    @Autowired
    private BuyRecordService buyRecordService;
    @Autowired
    private BuyRecordShowService buyRecordShowService;
    @Autowired
    private OrderService orderService;

    @RequestMapping("/create")
    public String createBuyRecord(String orders, HttpServletResponse response) throws Exception {
        BuyRecord buyRecord = new BuyRecord();
        JSONObject result = new JSONObject();
        int last = orders.lastIndexOf(",");
        orders=orders.substring(0,last);
        String orderId = orders.split(",")[0];
        int uid = 0;
        if(!StringUtils.isNotBlank(orders)){
            result.put("success", false);
            return null;
        }
        HashMap<String, Object> map = new HashMap<>();
        map.put("orders",orderId);
        List<Order> orders1 = orderService.listOrder(map);
        uid=orders1.get(0).getUid();

        buyRecord.setOrders(orders);
        buyRecord.setUid(uid);
        int flag = buyRecordService.createBuyRecord(buyRecord);
        if(flag>0){
            result.put("success",true);
        }else {
            result.put("success",false);
        }
        ResponseUtil.write(response, result);


        return null;
    }

    @RequestMapping("/listBuyRecord")
    public String listBuyRecords(@RequestParam(value = "page", required = false) String page,
                                 @RequestParam(value = "rows", required = false) String rows,
                                 @RequestParam(value = "success", required = false) String success,
                                 BuyRecord buyRecord, HttpServletResponse response) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        if (page != null && rows != null) {
            PageBean pageBean = new PageBean(Integer.parseInt(page),
                    Integer.parseInt(rows));
            map.put("start", pageBean.getStart());
            map.put("size", pageBean.getPageSize());
        }
        List<BuyRecordShowDto> buyRecordShowDtos = null;
        int total = 0;
        if (buyRecord.getId() != 0) {
            map.put("id", buyRecord.getId());
        }
        buyRecordShowDtos = buyRecordShowService.findBuyRecords(map);
        total = buyRecordShowService.findTotal(map);

        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(buyRecordShowDtos);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/deleteBuyRecord")
    public String deleteProduct(@RequestParam(value = "ids") String ids,HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            buyRecordService.deleteById(Integer.parseInt(idsStr[i]));
        }
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }


}
