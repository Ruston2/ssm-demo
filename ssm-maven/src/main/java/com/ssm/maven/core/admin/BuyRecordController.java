package com.ssm.maven.core.admin;

import com.ssm.maven.core.entity.BuyRecord;
import com.ssm.maven.core.entity.Order;
import com.ssm.maven.core.service.BuyRecordService;
import com.ssm.maven.core.util.ResponseUtil;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @Author cccc
 * @Date 2024/03/11 15:57
 **/
@Controller
@RequestMapping("/buyRecord")
public class BuyRecordController {

    @Autowired
    private BuyRecordService buyRecordService;

    @RequestMapping("/create")
    public String createBuyRecord(String orders, HttpServletResponse response) throws Exception {
        BuyRecord buyRecord = new BuyRecord();
        JSONObject result = new JSONObject();
        int last = orders.lastIndexOf(",");
        orders=orders.substring(0,last);
        if(!StringUtils.isNotBlank(orders)){
            result.put("success", false);
            return null;
        }

        buyRecord.setOrders(orders);
        int flag = buyRecordService.createBuyRecord(buyRecord);
        if(flag>0){
            result.put("success",true);
        }else {
            result.put("success",false);
        }
        ResponseUtil.write(response, result);


        return null;
    }


}
