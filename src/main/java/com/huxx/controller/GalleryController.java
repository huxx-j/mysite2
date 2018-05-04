package com.huxx.controller;

import com.huxx.service.GalleryService;
import com.huxx.vo.GalleryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@Controller
@RequestMapping(value = "/gallery")
public class GalleryController {

    @Autowired
    private GalleryService galleryService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String form(Model model) {
        List<GalleryVO> list = galleryService.getList();
        model.addAttribute("list",list);
        return "gallery/list";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String upload(@RequestParam("file") MultipartFile file){ // 파일을 파라미터로 받을때 타입은 MultipartFile로 한다.
        galleryService.restore(file);
        return "redirect:list";
    }
}
