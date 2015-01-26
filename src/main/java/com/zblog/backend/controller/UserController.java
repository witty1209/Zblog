package com.zblog.backend.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zblog.backend.form.validator.UserFormValidator;
import com.zblog.common.dal.entity.User;
import com.zblog.common.plugin.MapContainer;
import com.zblog.common.util.IdGenarater;
import com.zblog.common.util.StringUtils;
import com.zblog.common.util.web.WebContextHolder;
import com.zblog.service.UserService;

@Controller
@RequestMapping("/backend/users")
public class UserController{
  @Autowired
  private UserService userService;

  @RequestMapping(method = RequestMethod.GET)
  public String index(@RequestParam(value = "page", defaultValue = "1") int page, Model model){
    model.addAttribute("page", userService.list(page, 15));
    return "backend/user/list";
  }

  @RequestMapping(method = RequestMethod.POST)
  public String insert(User user, String repass, Model model){
    MapContainer form = UserFormValidator.validateInsert(user, repass);
    if(!form.isEmpty()){
      model.addAllAttributes(form);
      return "backend/user/edit";
    }

    user.setId(IdGenarater.uuid19());
    user.setCreateTime(new Date());
    user.setLastUpdate(new Date());

    userService.insert(user);
    return "redirect:/backend/users";
  }

  @RequestMapping(method = RequestMethod.PUT)
  public String update(User user, String repass, Model model){
    MapContainer form = UserFormValidator.validateUpdate(user, repass);
    if(!form.isEmpty()){
      model.addAllAttributes(form);
      model.addAttribute("user", user);
      return "backend/user/edit";
    }

    userService.update(user);
    return "redirect:/backend/users";
  }

  @ResponseBody
  @RequestMapping(value = "/{userid}", method = RequestMethod.DELETE)
  public Object remove(@PathVariable("userid") String userid){
    userService.deleteById(userid);
    return new MapContainer("success", true);
  }

  @RequestMapping(value = "/edit", method = RequestMethod.GET)
  public String edit(String uid, Model model){
    if(!StringUtils.isBlank(uid))
      model.addAttribute("user", userService.loadById(uid));
    return "backend/user/edit";
  }

  @RequestMapping(value = "/my", method = RequestMethod.GET)
  public String my(Model model){
    model.addAttribute("my", WebContextHolder.get().getUser());
    return "backend/user/my";
  }

}
