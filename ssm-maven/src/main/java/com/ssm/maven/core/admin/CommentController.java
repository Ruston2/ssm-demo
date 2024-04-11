package com.ssm.maven.core.admin;

import com.ssm.maven.core.entity.Comment;
import com.ssm.maven.core.entity.Consumer;
import com.ssm.maven.core.entity.PageBean;
import com.ssm.maven.core.entity.Product;
import com.ssm.maven.core.entity.dto.CommentShowDto;
import com.ssm.maven.core.entity.dto.CommentsShowDto;
import com.ssm.maven.core.service.*;
import com.ssm.maven.core.util.ResponseUtil;
import com.ssm.maven.core.util.StringUtil;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private CommentShowService commentShowService;

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

    @RequestMapping("/commentManage")
    public String commentManage(@RequestParam(value = "page", required = false) String page,
                                @RequestParam(value = "rows", required = false) String rows,
                                @RequestParam(value = "success", required = false) String success,
                                CommentShowDto comment, HttpServletResponse response) throws Exception {

        Map<String, Object> map = new HashMap<String, Object>();
        if (page != null && rows != null) {
            PageBean pageBean = new PageBean(Integer.parseInt(page),
                    Integer.parseInt(rows));
            map.put("start", pageBean.getStart());
            map.put("size", pageBean.getPageSize());
        }
        List<CommentShowDto> products = null;
        Long total = 0L;
        if (comment.getPname() != null &&
                !"".equals(comment.getPname())) {
            map.put("pname", StringUtil.formatLike(comment.getPname()));
        }
        products = commentShowService.findComments(map);
        total = commentShowService.getTotleComments(map);
        net.sf.json.JSONObject result = new net.sf.json.JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(products);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;

    }

    @RequestMapping("/deleteComment")
    public String deleteComments(@RequestParam(value = "ids") String ids,HttpServletResponse response) throws Exception {
        net.sf.json.JSONObject result = new net.sf.json.JSONObject();
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            commentService.deleteComment(idsStr[i]);
        }
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/modifyComment")
    public String modifyComment(CommentShowDto comment,HttpServletResponse response) throws Exception {
        int resultTotal = 0;
        net.sf.json.JSONObject result = new net.sf.json.JSONObject();

        int i = commentService.modifyComment(comment);
        resultTotal=i;
        if (resultTotal > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }


}
