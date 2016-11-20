package com.zblog.web.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zblog.biz.PostManager;
import com.zblog.core.WebConstants;
import com.zblog.service.TagService;

@Controller
@RequestMapping("/tags")
public class TagController{
  @Autowired
  private PostManager postManager;
  @Autowired
  private TagService tagService;
  @RequestMapping(value = "/{tagName}", method = RequestMethod.GET)
  public String post(@PathVariable("tagName") String tagName,
      @RequestParam(value = "page", defaultValue = "1") int page, Model model){
    model.addAttribute("page", postManager.listByTag(tagName, page, 10));

    model.addAttribute("tag", tagName);
    model.addAttribute(WebConstants.PRE_TITLE_KEY, tagName);
    model.addAttribute("tag_list", tagService.list());
    return "index";
  }

}
