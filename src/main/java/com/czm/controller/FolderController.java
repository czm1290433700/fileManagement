package com.czm.controller;

import com.czm.model.FolderEntity;
import com.czm.repository.FolderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class FolderController {
    @Autowired
    FolderRepository folderRepository;
    /*我的文件夹页面*/
    @RequestMapping(value="/personalPage/folder/{id}",method= RequestMethod.GET)
    public String folder(@PathVariable("id")Integer id, ModelMap modelMap){
        List<FolderEntity> folderEntities=folderRepository.findAll();
        modelMap.addAttribute("folderEntities",folderEntities);
        modelMap.addAttribute("id",id);
         return "/personalPage/folder";
    }
    /*创建文件夹*/
    @RequestMapping(value = "/personalPage/folder/{id}",method = RequestMethod.POST)
    public String createFolder(@ModelAttribute FolderEntity folderEntity,@PathVariable("id")Integer id){
        folderRepository.saveAndFlush(folderEntity);
        return "redirect:/personalPage/folder/"+id;
    }
}
