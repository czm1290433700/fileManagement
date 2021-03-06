package com.czm.controller;

import com.czm.model.CourseEntity;
import com.czm.model.NoteEntity;
import com.czm.model.UserEntity;
import com.czm.repository.CourseRepository;
import com.czm.repository.NoteRepository;
import com.czm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private CourseRepository courseRepository;
    @Autowired
    private NoteRepository noteRepository;
    @Autowired
    private UserRepository userRepository;
    /*首页*/
    @RequestMapping(value="/",method= RequestMethod.GET)
    public String index(ModelMap modelMap){
        List<UserEntity> userEntities=userRepository.findAllByFollowNum();
        modelMap.addAttribute("userEntities",userEntities);
        return "home/index";
    }
    /*注册*/
    @RequestMapping(value="/register",method=RequestMethod.GET)
    public String register(){
        return "home/register";
    }
    /*登录*/
    @RequestMapping(value="/login",method=RequestMethod.GET)
    public String login(){
        return "home/login";
    }
    /*提个问题*/
    @RequestMapping(value="/question",method = RequestMethod.GET)
    public String question(){
        return "home/question";
    }
    /*个人首页*/
    @RequestMapping(value="/personalPage/home",method=RequestMethod.GET)
    public String home(ModelMap modelMap,HttpSession httpSession){
        UserEntity user=(UserEntity)httpSession.getAttribute("user");
        List<CourseEntity> courseEntities=courseRepository.findAllByUserIdDesc(user.getUserId());
        List<NoteEntity> noteEntities=noteRepository.findAllByUserIdDesc(user.getUserId());
        modelMap.addAttribute("courseEntities",courseEntities);
        modelMap.addAttribute("noteEntities",noteEntities);
        return "/personalPage/home";
    }
    /*更改基本信息*/
    @RequestMapping(value="/personalPage/info/basicInfo",method=RequestMethod.GET)
    public String basicInfo(){
        return "/personalPage/info/basicInfo";
    }
    /*更改头像*/
    @RequestMapping(value="/personalPage/info/picInfo",method=RequestMethod.GET)
    public String picInfo(){
        return "/personalPage/info/picInfo";
    }
    /*更改密码*/
    @RequestMapping(value="/personalPage/info/pwdInfo",method=RequestMethod.GET)
    public String pwdInfo(){
        return "/personalPage/info/pwdInfo";
    }
    /*添加课程*/
    @RequestMapping(value="/personalPage/addCourse",method=RequestMethod.GET)
    public String addCourse(){
        return "/personalPage/addCourse";
    }
    /*退出登录*/
    @RequestMapping(value = "/exit",method = RequestMethod.GET)
    public String exit(HttpSession httpSession){
        httpSession.removeAttribute("user");
        return "redirect:/";
    }
    /*注册表单验证姓名*/
    @RequestMapping(value = "/registerCheck/checkName",method = RequestMethod.POST,produces="text/html;charset=UTF-8;")
    public @ResponseBody String registerCheckName(@RequestBody UserEntity userEntity){
        UserEntity user=userRepository.findOneByUsername(userEntity.getUsername());
        if(user==null){
            return null;
        }else{
            return "该用户名已被注册";
        }
    }
    /*注册表单验证电话*/
    @RequestMapping(value = "/registerCheck/checkPhone",method = RequestMethod.POST,produces="text/html;charset=UTF-8;")
    public @ResponseBody String registerCheckPhone(@RequestBody UserEntity userEntity){
        UserEntity user=userRepository.findOneByPhone(userEntity.getPhone());
        if(user!=null){
            return "该手机号已被注册";
        }else{
            return null;
        }
    }
    @RequestMapping(value = "/checkPassword",method = RequestMethod.POST,produces = "text/html;charset=UTF-8;")
    public @ResponseBody String checkPassword(@RequestBody UserEntity userEntity,HttpSession httpSession){
        UserEntity user=(UserEntity)httpSession.getAttribute("user");
        if(user.getPassword().equals(userEntity.getPassword())){
            return null;
        }else{
            return "请输入正确的账户密码！";
        }
    }
}
