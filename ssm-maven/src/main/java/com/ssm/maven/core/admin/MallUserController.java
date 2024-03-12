package com.ssm.maven.core.admin;

import com.ssm.maven.core.entity.Consumer;
import com.ssm.maven.core.service.MallUserService;
import com.ssm.maven.core.util.CheckCodeUtils;
import com.ssm.maven.core.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author cccc
 * @Date 2024/03/05 16:42
 **/
@Controller
@RequestMapping("/mallUser")
public class MallUserController {

    @Autowired
    private MallUserService mallUserService;
    @RequestMapping("checkCode")
    public String checkCode(HttpServletResponse response, HttpSession session) throws IOException {
        response.setContentType("image/jpg");
        ServletOutputStream outputStream = response.getOutputStream();
        String outputVerifyImage = CheckCodeUtils.outputVerifyImage(100, 50, outputStream, 4);
        session.setAttribute("check", outputVerifyImage);
        System.out.println(outputVerifyImage);
        return null;
    }

    @RequestMapping("/usernameCheck")
    public String usernameCheck(String username, HttpServletResponse response,HttpSession session) throws Exception {
        Consumer consumer = mallUserService.findByUsername(username);
        JSONObject result = new JSONObject();
        if(consumer!=null){
            session.setAttribute("consumer",consumer);
            result.put("data", true);
        }else{
            result.put("data", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/pwdCheck")
    public String passwordCheck(Consumer consumer,HttpServletResponse response,HttpSession session,String check,HttpServletRequest request){
        Object checkCode = session.getAttribute("check");
        if(check.equals(checkCode)){
            int i = mallUserService.insertConsumer(consumer);
            if(i>0) {
                request.setAttribute("register_err", "注册成功");
                return "redirect:/mall/login.jsp";
            }else {
                request.setAttribute("register_err", "注册失败");
                return "forward:/mall/register.jsp";
            }
        }else{
            request.setAttribute("register_err", "验证码错误");
            return "forward:/mall/register.jsp";
        }
    }

    @RequestMapping("/login")
    public String doLogin(@Param("username")String username, @Param("username")String password,
                          String auto,String rember,String check,HttpServletResponse response, HttpServletRequest request,HttpSession session){
        Object checkCode = session.getAttribute("check");
        if(checkCode.equals(check)){
            Consumer user=mallUserService.findByUAndP(username,password);
            if(user!=null){
                if("on".equals(auto)){
                    Cookie cookie=new Cookie("auto", user.getUsername()+"@"+user.getPassword());
                    cookie.setMaxAge(60);
                    response.addCookie(cookie);
                }
                else if("on".equals(rember)){
                    Cookie cookie=new Cookie("name", user.getUsername());
                    cookie.setMaxAge(60);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
                session.setAttribute("username", username);
                System.out.println("登录成功");
                return "redirect:/mall/index.jsp";
            }else{
                request.setAttribute("login_err", "用户名或密码错误");
            }
        }else {
            request.setAttribute("login_err","验证码错误");
        }
        return "forward:/mall/login.jsp";
    }
}
