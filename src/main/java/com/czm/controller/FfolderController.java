package com.czm.controller;

import com.czm.model.CourseEntity;
import com.czm.model.FfolderEntity;
import com.czm.model.NoteEntity;
import com.czm.model.UserEntity;
import com.czm.repository.CourseRepository;
import com.czm.repository.FfolderRespository;
import com.czm.repository.NoteRepository;
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
public class FfolderController {
    @Autowired
    FfolderRespository ffolderRespository;
    @Autowired
    CourseRepository courseRepository;
    @Autowired
    NoteRepository noteRepository;
    /*我的收藏夹*/
    @RequestMapping(value="/personalPage/favorite/{id}",method= RequestMethod.GET)
    public String favorite(@PathVariable("id") Integer id, ModelMap modelMap, HttpSession httpSession){
        UserEntity user=(UserEntity)httpSession.getAttribute("user");
        List<CourseEntity> courseEntities=courseRepository.findAllByUserId(user.getUserId());
        modelMap.addAttribute("courseEntities",courseEntities);
        List<FfolderEntity> ffolderEntities=ffolderRespository.findAllByUserId(user.getUserId());
        modelMap.addAttribute("ffolderEntities",ffolderEntities);
        modelMap.addAttribute("id",id);
        return "/personalPage/favorite";
    }
    /*添加到收藏夹*/
    @RequestMapping(value ="/personalPage/favoriteNote/{noteId}",method = RequestMethod.GET)
    public String addFavorite(@PathVariable("noteId") Integer noteId,HttpSession httpSession,ModelMap modelMap){
        NoteEntity noteEntity=noteRepository.findOne(noteId);
        UserEntity userEntity=(UserEntity)httpSession.getAttribute("user");
        CourseEntity courseEntity=courseRepository.findOne(noteEntity.getCourseByCourseId().getCourseId());
        FfolderEntity ffolderEntity=new FfolderEntity(noteEntity,userEntity,courseEntity);
        ffolderRespository.saveAndFlush(ffolderEntity);
        modelMap.addAttribute("ffolderEntity",ffolderEntity);
        return "redirect:/infoNote/"+noteId;
    }
    /*取消收藏*/
    @RequestMapping(value = "/personalPage/cancelFavoriteNote/{noteId}",method = RequestMethod.GET)
    public String cancelFavorite(@PathVariable("noteId")Integer noteId,HttpSession httpSession,ModelMap modelMap){
        UserEntity userEntity=(UserEntity)httpSession.getAttribute("user");
        ffolderRespository.deleteOneByNoteIdAndUserId(noteId,userEntity.getUserId());
        modelMap.addAttribute("ffolderEntity",null);
        return "redirect:/infoNote/"+noteId;
    }
    /*我的收藏夹查询*/
    @RequestMapping(value = "/personalPage/favorite/{id}",method = RequestMethod.POST)
    public String FavoriteQuery(@ModelAttribute FfolderEntity ffolderEntity,HttpSession httpSession,@PathVariable("id")Integer id, ModelMap modelMap){
        UserEntity userEntity=(UserEntity)httpSession.getAttribute("user");
        List<CourseEntity> courseEntities=courseRepository.findAllByUserId(userEntity.getUserId());
        modelMap.addAttribute("courseEntities",courseEntities);
        Integer courseId=ffolderEntity.getCourseByCourseId().getCourseId();
        String title=ffolderEntity.getNoteByNoteId().getTitle();
        Integer userId=userEntity.getUserId();
        List<FfolderEntity> ffolderEntities=null;
        /*通过courseId查询*/
        if(courseId!=0&&title==null){
            ffolderEntities=ffolderRespository.findAllByCourseIdAndUserId(courseId,userId);
        }
        /*通过title模糊查询*/
        if(courseId==0&&title!=null){
            ffolderEntities=ffolderRespository.findAllByTitleAndUserId(title,userId);
        }
        /*通过courseId和title模糊查询*/
        if(courseId!=0&&title!=null){
            ffolderEntities=ffolderRespository.findAllByCourseIdAndTitleAndUserId(courseId,title,userId);
        }
        modelMap.addAttribute("ffolderEntities",ffolderEntities);
        modelMap.addAttribute("courseId",courseId);
        modelMap.addAttribute("title",title);
        modelMap.addAttribute("id",id);
        return "/personalPage/favorite";
    }
}
