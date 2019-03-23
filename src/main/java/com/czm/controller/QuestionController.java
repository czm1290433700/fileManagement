package com.czm.controller;

import com.czm.model.*;
import com.czm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class QuestionController {
    @Autowired
    QuestionRepository questionRepository;
    @Autowired
    QuestionTagRepository questionTagRepository;
    @Autowired
    ReferenceRespository referenceRespository;
    @Autowired
    AnswerRepository answerRepository;
    @Autowired
    CommentRepository commentRepository;
    /*提问上传*/
    @RequestMapping(value = "/question",method = RequestMethod.POST)
    public String QuestionSubmit(@ModelAttribute QuestionEntity questionEntity){
        String tagContent=questionEntity.getTagContent();
        String[] tags=tagContent.split(",");
        questionRepository.saveAndFlush(questionEntity);
        for(String tag:tags){
            QuestiontagEntity questiontagEntity=questionTagRepository.findOneByName(tag);
            if(questiontagEntity==null){
                QuestiontagEntity questionTag=new QuestiontagEntity(tag);
                questionTagRepository.saveAndFlush(questionTag);
            }
            QuestionEntity question=questionRepository.findOneByCreateTime(questionEntity.getCreateTime());
            ReferenceEntity referenceEntity=new ReferenceEntity(question,questiontagEntity);
            referenceRespository.saveAndFlush(referenceEntity);
        }
        return "redirect:answer/1";
    }
    /*回答问题页面*/
    @RequestMapping(value="/answer/{id}",method=RequestMethod.GET)
    public String answer(@PathVariable("id")Integer id, ModelMap modelMap){
        List<QuestiontagEntity> questiontagEntities=questionTagRepository.findAllByUseTimes();
        modelMap.addAttribute("questiontagEntities",questiontagEntities);
        modelMap.addAttribute("id",id);
        List<QuestionEntity> LatestQuestions=questionRepository.findAllByCreateTimeDesc();
        List<QuestionEntity> HottestQuestions=questionRepository.findAllByBrowseNumDesc();
        modelMap.addAttribute("LatestQuestions",LatestQuestions);
        modelMap.addAttribute("HottestQuestions",HottestQuestions);
        return "home/answer";
    }
    /*回答问题筛选请求*/
    @RequestMapping(value = "/answer/{id}",method = RequestMethod.POST)
    public String answerPost(@PathVariable("id")Integer id,@ModelAttribute("keyword") String keyword,@ModelAttribute("tableId") int tableId,ModelMap modelMap){
        List<QuestiontagEntity> questiontagEntities=questionTagRepository.findAllByUseTimes();
        modelMap.addAttribute("questiontagEntities",questiontagEntities);
        modelMap.addAttribute("id",id);
        if(tableId==1){
            List<QuestionEntity> LatestQuestions=questionRepository.fuzzyFindAllByCreateTimeDesc(keyword);
            List<QuestionEntity> HottestQuestions=questionRepository.findAllByBrowseNumDesc();
            modelMap.addAttribute("LatestQuestions",LatestQuestions);
            modelMap.addAttribute("HottestQuestions",HottestQuestions);
        }
        if(tableId==2){
            List<QuestionEntity> LatestQuestions=questionRepository.findAllByCreateTimeDesc();
            List<QuestionEntity> HottestQuestions=questionRepository.fuzzyFindAllByBrowseNumDesc(keyword);
            modelMap.addAttribute("LatestQuestions",LatestQuestions);
            modelMap.addAttribute("HottestQuestions",HottestQuestions);
        }
        return "home/answer";
    }
    /*问题标签*/
    @RequestMapping(value = "/signAns/{questionTagId}/{id}",method = RequestMethod.GET)
    public String signAns(@PathVariable("questionTagId")Integer questionTagId,@PathVariable("id") Integer id,ModelMap modelMap){
        QuestiontagEntity questiontagEntity=questionTagRepository.findOne(questionTagId);
        List<QuestionEntity> LatestQuestions=questionRepository.findAllByTagContentAndCreateTimeDesc(questiontagEntity.getName());
        List<QuestionEntity> HottestQuestions=questionRepository.findAllByTagContentAndBrowseNum(questiontagEntity.getName());
        modelMap.addAttribute("name",questiontagEntity.getName());
        modelMap.addAttribute("LatestQuestions",LatestQuestions);
        modelMap.addAttribute("HottestQuestions",HottestQuestions);
        modelMap.addAttribute("id",id);
        return "home/signAns";
    }
    /*问题标签模糊查询*/
    @RequestMapping(value = "/signAns/{questionTagId}/{id}",method = RequestMethod.POST)
    public String signAnsPost(@PathVariable("questionTagId")Integer questionTagId,@PathVariable("id") Integer id,@ModelAttribute("keyword") String keyword,@ModelAttribute("tableId") int tableId,ModelMap modelMap){
        QuestiontagEntity questiontagEntity=questionTagRepository.findOne(questionTagId);
        modelMap.addAttribute("name",questiontagEntity.getName());
        modelMap.addAttribute("id",id);
        if(tableId==1){
            List<QuestionEntity> LatestQuestions=questionRepository.fuzzyFindAllByTagContentAndCreateTimeDesc(questiontagEntity.getName(),keyword);
            List<QuestionEntity> HottestQuestions=questionRepository.findAllByTagContentAndBrowseNum(questiontagEntity.getName());
            modelMap.addAttribute("LatestQuestions",LatestQuestions);
            modelMap.addAttribute("HottestQuestions",HottestQuestions);
        }
        if(tableId==2){
            List<QuestionEntity> LatestQuestions=questionRepository.findAllByTagContentAndCreateTimeDesc(questiontagEntity.getName());
            List<QuestionEntity> HottestQuestions=questionRepository.fuzzyFindAllByTagContentAndBrowseNum(questiontagEntity.getName(),keyword);
            modelMap.addAttribute("LatestQuestions",LatestQuestions);
            modelMap.addAttribute("HottestQuestions",HottestQuestions);
        }
        return "home/signAns";
    }
    /*问题内容*/
    @RequestMapping(value="/infoAns/{questionId}",method=RequestMethod.GET)
    public String infoAns(@PathVariable("questionId") Integer questionId,ModelMap modelMap){
        QuestionEntity questionEntity=questionRepository.findOneByQuestionId(questionId);
        modelMap.addAttribute("questionEntity",questionEntity);
        List<AnswerEntity> otherAnswers=answerRepository.selectOtherAnswers(questionId);
        modelMap.addAttribute("otherAnswers",otherAnswers);
        AnswerEntity bestAnswer=answerRepository.selectBestAnswer(questionId);
        modelMap.addAttribute("bestAnswer",bestAnswer);
        String tagContent=questionEntity.getTagContent();
        String[] tags=tagContent.split(",");
        List<QuestionEntity> otherQuestions=questionRepository.findAllByTagContent(tags[0]);
        otherQuestions.remove(questionEntity);
        modelMap.addAttribute("otherQuestions",otherQuestions);
        questionRepository.updateBrowseNum(questionId);
        return "home/infoAns";
    }
    /*回答问题*/
    @RequestMapping(value = "/infoAns/{questionId}",method = RequestMethod.POST)
    public String infoAnsPost(@PathVariable("questionId") Integer questionId, @ModelAttribute AnswerEntity answerEntity, ModelMap modelMap){
        answerRepository.saveAndFlush(answerEntity);
        return "redirect:/infoAns/"+questionId;
    }
    /*采纳问题*/
    @RequestMapping(value = "/resolveQuestion/{questionId}/{answerId}",method = RequestMethod.GET)
    public String resolveQuestion(@PathVariable("questionId") Integer questionId,@PathVariable("answerId") Integer answerId, ModelMap modelMap){
        questionRepository.updateIsResolve(questionId);
        answerRepository.updateIsBestAnswer(answerId);
        return "redirect:/infoAns/"+questionId;
    }
}
