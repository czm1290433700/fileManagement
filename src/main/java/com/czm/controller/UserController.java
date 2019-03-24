package com.czm.controller;

import com.czm.model.UserEntity;
import com.czm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class UserController {
    @Autowired
    private UserRepository userRepository;
    /*登录验证*/
    @RequestMapping(value="/login/loginCheck",method= RequestMethod.POST,produces="text/html;charset=UTF-8;")
    public @ResponseBody String login(@RequestBody UserEntity userEntity, HttpSession httpSession){
        UserEntity user=userRepository.findOneByPhone(userEntity.getPhone());
        if(userEntity.getPassword().equals(user.getPassword())){
            httpSession.setAttribute("user",user);
            return null;
        }
        else{
            return "用户名不存在或密码错误！";
        }
    }
    /*账户注册*/
    @RequestMapping(value="/register",method = RequestMethod.POST)
    public String register(@ModelAttribute UserEntity userEntity, ModelMap modelMap){
        userRepository.saveAndFlush(userEntity);
        modelMap.addAttribute("message","注册成功");
        return "redirect:/login";
    }
    /*修改基本信息*/
    @RequestMapping(value = "/personalPage/info/basicInfo",method = RequestMethod.POST)
    public String personalBasicInfoUpdate(@ModelAttribute UserEntity userEntity,HttpSession httpSession){
        userRepository.UpdateBasicInfo(userEntity.getSex(),userEntity.getAge(),userEntity.getYear(),userEntity.getMonth(),
                userEntity.getDay(),userEntity.getMajor(),userEntity.getSemester(),userEntity.getSignature(),userEntity.getProvince(),
                userEntity.getCity(),userEntity.getArea(),userEntity.getSchool(),userEntity.getPhone(),userEntity.getUserId());
        userRepository.flush();
        UserEntity user=userRepository.findOne(userEntity.getUserId());
        httpSession.setAttribute("user",user);
        return "/personalPage/info/basicInfo";
    }
    /*修改密码信息*/
    @RequestMapping(value = "/personalPage/info/pwdInfo",method = RequestMethod.POST)
    public String personalPwdInfoUpdate(@ModelAttribute UserEntity userEntity,HttpSession httpSession){
        UserEntity user=(UserEntity)httpSession.getAttribute("user");
        userRepository.UpdatePassword(userEntity.getPassword(),user.getUserId());
        userRepository.flush();
        return "/personalPage/info/pwdInfo";
    }
    /*修改用户头像*/
    @RequestMapping(value = "/personalPage/info/picInfo",method = RequestMethod.POST)
    public String personalPicInfoUpdate(@ModelAttribute MultipartFile pic, HttpSession httpSession, HttpServletRequest request) throws IOException {
        if (!pic.isEmpty()) {
            String path = request.getSession().getServletContext().getRealPath("//WEB-INF//pic//");
            String originalFileName = pic.getOriginalFilename();
            // 新的图片名称
            String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
            // 新的图片
            UserEntity user=(UserEntity)httpSession.getAttribute("user");
            File newFile = new File(path +"//"+ newFileName);
            // 将内存中的数据写入磁盘
            pic.transferTo(newFile);
            String photoWay="/pic/"+newFileName;
            userRepository.UpdatePic(photoWay,user.getUserId());
            userRepository.flush();
            user.setPhoto(photoWay);
            httpSession.setAttribute("user",user);
        }
        return "/personalPage/info/picInfo";
    }
}
