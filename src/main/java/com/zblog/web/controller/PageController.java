package com.zblog.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zblog.common.dal.entity.Post;
import com.zblog.common.util.constants.WebConstants;
import com.zblog.service.CommentService;
import com.zblog.service.PostService;

@Controller
@RequestMapping("/pages")
public class PageController{
  @Autowired
  private PostService postService;
  @Autowired
  private CommentService commentService;

  @RequestMapping("/{pageid}")
  public String page(@PathVariable("pageid") String pageid, Model model){
    Post post = postService.loadById(pageid);
    if(post != null){
      model.addAttribute(WebConstants.PRE_TITLE_KEY, post.getTitle());
      model.addAttribute("post", post);
      model.addAttribute("comments", commentService.listByPost(pageid));
    }
    return "post";
  }

}
