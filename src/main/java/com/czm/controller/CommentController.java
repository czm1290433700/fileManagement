package com.czm.controller;

import com.czm.model.CommentEntity;
import com.czm.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommentController {
    @Autowired
    CommentRepository commentRepository;
    /*笔记处评论上传*/
    @RequestMapping(value = "/infoNote/{noteId}",method = RequestMethod.POST)
    public String infoNotePost(@ModelAttribute CommentEntity commentEntity, @PathVariable("noteId")Integer noteId){
        commentRepository.saveAndFlush(commentEntity);
        return "redirect:/infoNote/"+noteId;
    }
    /*回答处评论上传*/
    @RequestMapping(value = "/infoAns/commentSubmit/{questionId}",method = RequestMethod.POST)
    public String answerCommentSubmit(@ModelAttribute CommentEntity commentEntity,@PathVariable("questionId")Integer questionId){
        commentRepository.saveAndFlush(commentEntity);
        return "redirect:/infoAns/"+questionId;
    }
}
