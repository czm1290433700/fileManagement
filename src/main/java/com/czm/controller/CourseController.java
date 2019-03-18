package com.czm.controller;

import com.czm.model.CourseEntity;
import com.czm.model.UserEntity;
import com.czm.repository.CourseRepository;
import com.czm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CourseController {
    @Autowired
    CourseRepository courseRepository;
    @Autowired
    UserRepository userRepository;
    /*获取所有的课程*/
    @RequestMapping(value = "/personalPage/course/{id}",method = RequestMethod.GET)
    public String course(@PathVariable("id") Integer id, HttpSession httpSession, ModelMap modelMap){
        UserEntity user=(UserEntity)httpSession.getAttribute("user");
        List<CourseEntity> courseEntities=courseRepository.findAllByUserId(user.getUserId());
        modelMap.addAttribute("courseEntities",courseEntities);
        modelMap.addAttribute("id",id);
        return "/personalPage/course";
    }
    @RequestMapping(value = "/personalPage/addCourse",method = RequestMethod.POST)
    public String addCourse(@ModelAttribute CourseEntity courseEntity,HttpSession httpSession){
        courseRepository.saveAndFlush(courseEntity);
        UserEntity user=(UserEntity)httpSession.getAttribute("user");
        httpSession.setAttribute("user",userRepository.findOne(user.getUserId()));
        return "redirect:/personalPage/course/1";
    }
}
