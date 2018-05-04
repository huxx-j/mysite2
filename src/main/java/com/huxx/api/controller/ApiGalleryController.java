package com.huxx.api.controller;

import com.huxx.service.GalleryService;
import com.huxx.vo.GalleryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "/api/gallery")
public class ApiGalleryController {

    @Autowired
    GalleryService galleryService;

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public List<GalleryVO> list(){
        List<GalleryVO> list = galleryService.getList();
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public int del(@RequestBody GalleryVO galleryVO) {
        return galleryService.del(galleryVO);
    }
}
