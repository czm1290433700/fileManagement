package com.czm.controller;

import com.czm.model.FileEntity;
import com.czm.model.FolderEntity;
import com.czm.model.UserEntity;
import com.czm.repository.FileRespository;
import com.czm.repository.FolderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class FileController {
    @Autowired
    FolderRepository folderRepository;
    @Autowired
    FileRespository fileRespository;
    /*上传文件页面*/
    @RequestMapping(value = "/personalPage/addDocument",method = RequestMethod.GET)
    public String addDocument(ModelMap modelMap, HttpSession httpSession){
        UserEntity userEntity=(UserEntity)httpSession.getAttribute("user");
        List<FolderEntity> folderEntities=folderRepository.findAllByUserId(userEntity.getUserId());
        modelMap.addAttribute("folderEntities",folderEntities);
        return "/personalPage/addDocument";
    }
    /*上传页面*/
    @RequestMapping(value = "/personalPage/addDocument",method = RequestMethod.POST)
    public String addDocumentPost(@ModelAttribute FileEntity fileEntity, @ModelAttribute MultipartFile file, HttpServletRequest request) throws IOException {
        if(!file.isEmpty()){
            String path = request.getSession().getServletContext().getRealPath("//WEB-INF//file//");
            String originalFileName = file.getOriginalFilename();
            // 新的文件名称
            String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
            // 新的文件
            File newFile = new File(path +"//"+ newFileName);
            // 将内存中的数据写入磁盘
            file.transferTo(newFile);
            String location="/file/"+newFileName;
            Long size=file.getSize();
            String fileType=originalFileName.substring(originalFileName.lastIndexOf(".")).substring(1);
            fileEntity.setFileName(originalFileName);
            fileEntity.setFileType(fileType);
            fileEntity.setLocation(location);
            fileEntity.setSize(size);
            fileRespository.saveAndFlush(fileEntity);
        }
        return "redirect:/personalPage/folder/1";
    }
    /*文件内容*/
    @RequestMapping(value="/personalPage/folderContent/{folderId}/{id}",method=RequestMethod.GET)
    public String folderContent(@PathVariable("folderId")Integer folderId,@PathVariable("id")Integer id, ModelMap modelMap){
        List<FileEntity> fileEntities=fileRespository.findAllByFolderId(folderId);
        modelMap.addAttribute("fileEntities",fileEntities);
        FolderEntity folderEntity=folderRepository.findOne(folderId);
        modelMap.addAttribute("folderName",folderEntity.getName());
        modelMap.addAttribute("id",id);
        return "/personalPage/folderContent";
    }
}
