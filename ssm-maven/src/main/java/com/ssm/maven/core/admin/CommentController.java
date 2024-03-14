package com.ssm.maven.core.admin;

import com.ssm.maven.core.entity.Comment;
import com.ssm.maven.core.entity.Consumer;
import com.ssm.maven.core.entity.dto.CommentsShowDto;
import com.ssm.maven.core.service.CommentService;
import com.ssm.maven.core.service.CommentsShowService;
import com.ssm.maven.core.service.MallUserService;
import com.ssm.maven.core.service.ProductService;
import com.ssm.maven.core.util.ResponseUtil;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

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
    @Autowired
    private CommentsShowService commentsShowService;

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

    @RequestMapping("/getComments")
    public String getComments(Comment comment){
        int pid = comment.getPid();
        HashMap<String, Object> map = new HashMap<>();
        map.put("pid",pid);
        List<Comment> comments = commentService.getComments(map);
        return null;
    }

    @RequestMapping("getCommentsShow")
    public String getCommentsShow(String pid,HttpServletResponse response) throws Exception {
        List<CommentsShowDto> comments = commentsShowService.getCommentsShow(pid);
        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(comments);
        result.put("data",jsonArray);
        ResponseUtil.write(response,result);
        return null;
    }


}
