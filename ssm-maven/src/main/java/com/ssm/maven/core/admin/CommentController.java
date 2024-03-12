package com.ssm.maven.core.admin;

import com.ssm.maven.core.entity.Comment;
import com.ssm.maven.core.entity.Consumer;
import com.ssm.maven.core.service.CommentService;
import com.ssm.maven.core.service.MallUserService;
import com.ssm.maven.core.util.ResponseUtil;
import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @Author cccc
 * @Date 2024/03/12 16:04
 **/
@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private MallUserService mallUserService;
    @Autowired
    private CommentService commentService;

    @RequestMapping("/createComment")
    public String createComment(Comment comment, HttpSession session,HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        if(StringUtils.isNotBlank(comment.getComment())){
            String username = (String) session.getAttribute("username");
            Consumer byUsername = mallUserService.findByUsername(username);
            comment.setUid(byUsername.getId());
            int i = commentService.insertComment(comment);
            result.put("success", i > 0);
        }else {
            result.put("success",false);
        }

        ResponseUtil.write(response,result);

        return null;
    }


}
