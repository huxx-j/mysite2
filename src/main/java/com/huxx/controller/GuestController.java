package com.huxx.controller;

import com.huxx.service.GuestService;
import com.huxx.vo.GuestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/guest")
public class GuestController {

    @Autowired
    private GuestService guestService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("list", guestService.getList());
        return "guestbook/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(@ModelAttribute GuestVO guestVO){
        guestService.insert(guestVO);
        return "redirect:list";
    }

    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public String del(@ModelAttribute GuestVO guestVO){
        guestService.delete(guestVO);
        return "redirect:list";
    }

    @RequestMapping(value = "/delform", method = RequestMethod.GET)
    public String delform(@RequestParam("no") String no){
        return "guestbook/deleteform";
    }

    @RequestMapping(value = "/ajax_list", method = RequestMethod.GET)
    public String ajaxList(Model model){
        model.addAttribute("list", guestService.getList());
        return "guestbook/ajax_list";
    }
}
