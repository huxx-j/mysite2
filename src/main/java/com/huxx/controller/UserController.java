package com.huxx.controller;

import com.huxx.service.UserService;
import com.huxx.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/joinform", method = RequestMethod.GET)
    public String joinForm(){
        return "user/joinform";
    }

    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String join(@ModelAttribute UserVO userVO){
        userService.join(userVO);
        return "user/joinsuccess";
    }

    @RequestMapping(value = "/loginform", method = RequestMethod.GET)
    public String loginForm() {
        return "user/loginform";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpSession session, @RequestParam("email") String email, @RequestParam("password") String password) {
        UserVO userVO = userService.login(email, password);
        if(userVO!=null) {
            session.setAttribute("authUser", userVO);
            return "redirect:/main";
        } else {
            return "redirect:loginform?result=fail";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("authUser");
        session.invalidate();
        return "redirect:/main";
    }

    @RequestMapping(value = "/modifyform", method = RequestMethod.GET)
    public String modifyForm(HttpSession session, Model model) {
        UserVO userVO = (UserVO) session.getAttribute("authUser");
        model.addAttribute("userVO", userService.getUser(userVO));
        return "user/modifyform";
    }
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String update(@ModelAttribute UserVO userVO, HttpSession session) {
        userService.update(userVO);
        UserVO authVO = (UserVO) session.getAttribute("authUser");
        authVO.setName(userVO.getName());
        return "redirect:/main";
    }

}
