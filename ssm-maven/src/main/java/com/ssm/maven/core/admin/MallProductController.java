package com.ssm.maven.core.admin;

import com.ssm.maven.core.entity.Consumer;
import com.ssm.maven.core.entity.Favorite;
import com.ssm.maven.core.entity.User;
import com.ssm.maven.core.service.MallProductService;
import com.ssm.maven.core.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.stream.Collectors;

/**
 * @Author cccc
 * @Date 2024/03/07 16:39
 **/
@Controller
@RequestMapping("/mallProduct")
public class MallProductController {

    @Autowired
    private MallProductService mallProductService;

    @RequestMapping("/favorite")
    public String isFavorite(String pid, HttpServletResponse response, HttpSession session) throws Exception {
        Consumer currentUser = (Consumer) session.getAttribute("consumer");
        Favorite favorite = mallProductService.findFavoriteByUid(currentUser.getId());
        JSONObject result = new JSONObject();
        if(Arrays.stream(favorite.getFavoriteItems().split(",")).collect(Collectors.toList()).contains(pid)){
            result.put("success", 1);
        }else {
            result.put("success", 0);
        }
        ResponseUtil.write(response, result);
        return null;
    }
}
