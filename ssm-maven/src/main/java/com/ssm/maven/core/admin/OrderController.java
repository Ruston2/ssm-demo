package com.ssm.maven.core.admin;

import com.ssm.maven.core.entity.Consumer;
import com.ssm.maven.core.entity.Order;
import com.ssm.maven.core.entity.Product;
import com.ssm.maven.core.entity.dto.OrderShowDto;
import com.ssm.maven.core.service.MallUserService;
import com.ssm.maven.core.service.OrderService;
import com.ssm.maven.core.service.OrderShowService;
import com.ssm.maven.core.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author cccc
 * @Date 2024/03/10 15:36
 **/
@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private MallUserService mallUserService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderShowService orderShowService;

    @RequestMapping("/createOrder")
    public String createOrder(Product product, HttpSession session, String count, HttpServletResponse response) throws Exception {
        String username = (String) session.getAttribute("username");
        Consumer consumer = mallUserService.findByUsername(username);
        Order order = new Order();
        order.setPid(Integer.parseInt(product.getPid()));
        order.setUid(consumer.getId());
        HashMap<String, Object> map = new HashMap<>();
        map.put("pid",product.getPid());
        map.put("uid",consumer.getId());
        List<Order> orders = orderService.listOrders(map);
        int i=0;
        if(!orders.isEmpty()){
            int count1 = orders.get(0).getCount();
            int newCount = count1+Integer.parseInt(count);
            order.setOrderId(orders.get(0).getOrderId());
            order.setCount(newCount);
            order.setTotlePrice(newCount*Integer.parseInt(product.getShopPrice()));
            orderService.updateOrder(order);
        }else {
            order.setCount(Integer.parseInt(count));
            order.setTotlePrice(Integer.parseInt(count)*Integer.parseInt(product.getShopPrice()));
            i = orderService.insertOrder(order);
        }
        JSONObject result = new JSONObject();
        if(i>0){
            result.put("success", true);
        }else{
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/listOrders")
    public String listOrders(HttpSession session,HttpServletResponse response) throws Exception {
        String username = (String) session.getAttribute("username");
        Consumer consumer = mallUserService.findByUsername(username);
        HashMap<String, Object> map = new HashMap<>();
        map.put("uid",consumer.getId());
        List<OrderShowDto> orderShowDtos = orderShowService.listOrders(map);
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(orderShowDtos);
        result.put("data", jsonArray);
        ResponseUtil.write(response, result);
        System.out.println(result);
        return null;
    }

    @RequestMapping("/deleteOrder")
    public String deleteOrder(String orderId,HttpServletResponse response) throws Exception {
        if(orderId.split(",").length>1){
            List<String> list = Arrays.stream(orderId.split(",")).collect(Collectors.toList());
            for (int i = 0; i < list.size(); i++) {
                orderService.deleteOrderById(list.get(i));
            }
        }else{
            if(orderId.contains(",")){
                orderId=orderId.substring(0,orderId.lastIndexOf(","));
            }
           orderService.deleteOrderById(orderId);
        }
        return "redirect:/mall/cart.jsp";
    }

    @RequestMapping("/buy")
    public String buy(String orderId,HttpServletResponse response) throws Exception {
        List<String> ids = Arrays.stream(orderId.split(",")).collect(Collectors.toList());
        for (int i = 0; i < ids.size(); i++) {
            orderService.buyProduct(ids.get(i));
        }

        return "redirect:/mall/cart.jsp";
    }

}
