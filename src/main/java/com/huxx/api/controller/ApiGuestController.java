package com.huxx.api.controller;

import com.huxx.service.GuestService;
import com.huxx.vo.GuestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/api/guest")
public class ApiGuestController {

    @Autowired
    private GuestService guestService;

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public List<GuestVO> list(){
        List<GuestVO> list = guestService.getList();
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public GuestVO add(@ModelAttribute GuestVO guestVO){

        GuestVO vo = guestService.insert_ajax(guestVO);
        return vo;
    }
}
