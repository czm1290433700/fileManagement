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
public class NoteController {
    @Autowired
    private NoteRepository noteRepository;
    @Autowired
    private CourseRepository courseRepository;
    @Autowired
    private FfolderRespository ffolderRespository;
    /*用户主页*/
    @RequestMapping(value = "/personalPage/home/{id}",method = RequestMethod.GET)
    public String personalPage(@PathVariable("id") Integer userId, ModelMap modelMap){
        List<NoteEntity> noteEntities=noteRepository.selectNoteByUserId(userId);
        if(noteEntities.size()!=0){
            modelMap.addAttribute("noteList",noteEntities);
        }
        else {
            modelMap.addAttribute("noteList",null);
        }
        return "redirect:/personalPage/home";
    }
    /*我的笔记*/
    @RequestMapping(value="/personalPage/note/{courseId}/{id}",method=RequestMethod.GET)
    public String note(@PathVariable("id") Integer id, @PathVariable("courseId") Integer courseId,ModelMap modelMap, HttpSession httpSession){
        UserEntity user=(UserEntity)httpSession.getAttribute("user");
        List<CourseEntity> courseEntities=courseRepository.findAllByUserId(user.getUserId());
        modelMap.addAttribute("courseEntities",courseEntities);
        if(courseId==0){
            List<NoteEntity> noteEntities=noteRepository.selectNoteByUserId(user.getUserId());
            modelMap.addAttribute("noteEntities",noteEntities);
        }
        else{
            List<NoteEntity> noteEntities=noteRepository.selectNoteByUserIdAndCourseId(user.getUserId(),courseId);
            modelMap.addAttribute("noteEntities",noteEntities);
            CourseEntity course=courseRepository.findOne(courseId);
            modelMap.addAttribute("name",course.getName());
        }
        modelMap.addAttribute("id",id);
        modelMap.addAttribute("courseId",courseId);
        return "/personalPage/note";
    }
    /*我的笔记专项查询*/
    @RequestMapping(value="/personalPage/note/{courseId}/{id}",method=RequestMethod.POST)
    public String noteFind(@PathVariable("id") Integer id,@ModelAttribute NoteEntity noteEntity,ModelMap modelMap,HttpSession httpSession){
        Byte isPublic=noteEntity.getIsPublic();
        Integer courseId=noteEntity.getCourseByCourseId().getCourseId();
        Integer userId=noteEntity.getUserByUserId().getUserId();
        String title=noteEntity.getTitle();
        UserEntity user=(UserEntity)httpSession.getAttribute("user");
        List<CourseEntity> courseEntities=courseRepository.findAllByUserId(user.getUserId());
        modelMap.addAttribute("courseEntities",courseEntities);
        List<NoteEntity> noteEntities=null;
        /*通过isPublic查询*/
        if(isPublic!=2&&courseId==0&&title==null){
            noteEntities=noteRepository.selectNoteByIsPublicAndUserId(isPublic,userId);
        }
        /*通过courseId查询*/
        if(isPublic==2&&courseId!=0&&title==null){
            noteEntities=noteRepository.selectNoteByUserIdAndCourseId(userId,courseId);
        }
        /*通过title模糊查询*/
        if(isPublic==2&&courseId==0&&title!=null){
            noteEntities=noteRepository.fuzzySelectNote(userId,noteEntity.getTitle());
        }
        /*通过isPublic和courseId查询*/
        if(isPublic!=2&&courseId!=0&&title==null){
            noteEntities=noteRepository.selectNoteByUserIdAndCourseIdAndIsPublic(userId,courseId,isPublic);
        }
        /*通过isPublic和title模糊查询*/
        if(isPublic!=2&&courseId==0&&title!=null){
            noteEntities=noteRepository.fuzzySelectNoteByIsPublic(userId,title,isPublic);
        }
        /*通过CourseId和title模糊查询*/
        if(isPublic==2&&courseId!=0&&title!=null){
            noteEntities=noteRepository.fuzzySelectNoteByCourseId(userId,title,courseId);
        }
        /*通过isPublic,CourseId和title模糊查询*/
        if(isPublic!=2&&courseId!=0&&title!=null){
            noteEntities=noteRepository.fuzzySelectNoteByIsPublicAndCourseId(userId,title,isPublic,courseId);
        }
        modelMap.addAttribute("noteEntities",noteEntities);
        modelMap.addAttribute("id",id);
        modelMap.addAttribute("isPublic",isPublic);
        modelMap.addAttribute("courseID",courseId);
        modelMap.addAttribute("title",title);
        return "/personalPage/note";
    }
    /*笔记详情*/
    @RequestMapping(value = "/infoNote/{noteId}",method = RequestMethod.GET)
    public String infoNote(@PathVariable("noteId") Integer noteId,ModelMap modelMap,HttpSession httpSession){
        UserEntity user=(UserEntity)httpSession.getAttribute("user");
        NoteEntity note=noteRepository.selectNoteByNoteId(noteId);
        modelMap.addAttribute("note",note);
        if(user!=null){
            FfolderEntity ffolderEntity=ffolderRespository.findOneByNoteIdAndUserId(note.getNoteId(),user.getUserId());
            modelMap.addAttribute("ffolderEntity",ffolderEntity);
        }
        List<NoteEntity> otherNotes=noteRepository.findAll();
        otherNotes.remove(note);
        modelMap.addAttribute("otherNotes",otherNotes);
        noteRepository.UpdateNoteView(noteId);
        return "/home/infoNote";
    }
    /*添加笔记页面*/
    @RequestMapping(value="/personalPage/addNote",method=RequestMethod.GET)
    public String addNoteGet(ModelMap modelMap,HttpSession httpSession){
        UserEntity user=(UserEntity)httpSession.getAttribute("user");
        List<CourseEntity> courseEntities=courseRepository.findAllByUserId(user.getUserId());
        modelMap.addAttribute("courseEntities",courseEntities);
        return "/personalPage/addNote";
    }
    /*添加笔记*/
    @RequestMapping(value = "/personalPage/addNote",method = RequestMethod.POST)
    public String addNotePost(@ModelAttribute NoteEntity noteEntity){
        noteRepository.saveAndFlush(noteEntity);
        return "redirect:/personalPage/note/0/1";
    }
    /*删除笔记*/
    @RequestMapping(value="/personalPage/deleteNote/{userId}/{noteId}",method = RequestMethod.GET)
    public String deleteNote(@PathVariable("userId") Integer userId,@PathVariable("noteId") Integer noteId,HttpSession httpSession){
        UserEntity user=(UserEntity)httpSession.getAttribute("user");
        if(user.getUserId()==userId){
            noteRepository.delete(noteId);
        }
        return "redirect:/noteRecommend";
    }
    /*笔记推荐*/
    @RequestMapping(value="/noteRecommend/{id}",method=RequestMethod.GET)
    public String noteRecommend(@PathVariable("id") Integer id, ModelMap modelMap){
        List<CourseEntity> courseEntities=courseRepository.findAllByNoteNumDesc();
        List<NoteEntity> LatestNotes=noteRepository.findLatestNote();
        modelMap.addAttribute("courseEntities",courseEntities);
        modelMap.addAttribute("LatestNotes",LatestNotes);
        modelMap.addAttribute("id",id);
        return "home/noteRecommend";
    }
    /*笔记标签*/
    @RequestMapping(value="/signNote/{courseId}/{id}",method=RequestMethod.GET)
    public String signNote(@PathVariable("courseId") Integer courseId,@PathVariable("id") Integer id,ModelMap modelMap){
        CourseEntity course=courseRepository.findOne(courseId);
        List<NoteEntity> LatestNotes=noteRepository.findLatestNoteByCourseId(courseId);
        modelMap.addAttribute("course",course);
        modelMap.addAttribute("LatestNotes",LatestNotes);
        modelMap.addAttribute("id",id);
        return "home/signNote";
    }
    /*修改笔记GET*/
    @RequestMapping(value="/personalPage/modifyNote/{noteId}",method=RequestMethod.GET)
    public String modifyNote(@PathVariable("noteId")Integer noteId,ModelMap modelMap,HttpSession httpSession){
        NoteEntity noteEntity=noteRepository.selectNoteByNoteId(noteId);
        modelMap.addAttribute("noteEntity",noteEntity);
        UserEntity userEntity=(UserEntity)httpSession.getAttribute("user");
        List<CourseEntity> courseEntities=courseRepository.findAllByUserId(userEntity.getUserId());
        modelMap.addAttribute("courseEntities",courseEntities);
        return "/personalPage/modifyNote";
    }
    /*修改笔记POST*/
    @RequestMapping(value = "/personalPage/modifyNote/{noteId}",method = RequestMethod.POST)
    public String modifyNotePost(@PathVariable("noteId")Integer noteId,@ModelAttribute NoteEntity noteEntity){
        noteRepository.UpdateNote(noteEntity.getTitle(),noteEntity.getCourseByCourseId().getCourseId(),noteEntity.getIsPublic(),noteEntity.getContent(),noteId);
        return "redirect:/infoNote/"+noteId;
    }
}
