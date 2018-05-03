package com.huxx.api.controller;

import com.huxx.service.GuestService;
import com.huxx.vo.GuestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "/api/guest")
public class ApiGuestController {

    @Autowired
    private GuestService guestService;

//    @ResponseBody
//    @RequestMapping(value = "/list", method = RequestMethod.POST)
//    public List<GuestVO> list(){
//        List<GuestVO> list = guestService.getList();
//        return list;
//    }

//    @ResponseBody //파라미터로 보낼때
//    @RequestMapping(value = "/add", method = RequestMethod.POST)
//    public GuestVO add(@ModelAttribute GuestVO guestVO){
//
//        GuestVO vo = guestService.insert_ajax(guestVO);
//        return vo;
//    }

    @ResponseBody //JSON으로 보낼때
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public GuestVO add(@RequestBody GuestVO guestVO){

        GuestVO vo = guestService.insert_ajax(guestVO);
        return vo;
    }

    @ResponseBody
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public int del(@ModelAttribute GuestVO guestVO){
        return guestService.del_ajax(guestVO);
    }

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public List<GuestVO> infinityList(@RequestParam("c") int c){
        List<GuestVO> list = guestService.getInfinityList(c);

        return list;
    }
}
