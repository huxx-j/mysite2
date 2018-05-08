package com.huxx.controller;

import com.huxx.service.BoardService;
import com.huxx.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

//    @RequestMapping(value = "/list", method = RequestMethod.GET)
//    public String list(Model model,@ModelAttribute BoardVO boardVO) {
//        model.addAttribute("list",boardService.selectList(boardVO));
//        return "board/list";
//    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list (@RequestParam(value = "crtPage", required = false, defaultValue = "1") int crtPage,
                        @RequestParam(value = "kwd", required = false, defaultValue ="") String kwd,
                        Model model){
        model.addAttribute("r_Map", boardService.selectList(crtPage,kwd));
        return "board/list";
    }

    @RequestMapping(value = "/writeform", method = RequestMethod.GET)
    public String writeForm(){
        return "board/write";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(@ModelAttribute BoardVO boardVO){
        boardService.insert(boardVO);
        return "/board/list";
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view (@RequestParam("no") String no, Model model) {
        model.addAttribute("boardVO", boardService.selectView(no));
        return "board/view";
    }

    @RequestMapping(value = "/modifyform", method = RequestMethod.GET)
    public String modify(@RequestParam("no") String no, Model model) {
        model.addAttribute("boardVO", boardService.selectModify(no));
        return "board/modify";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String update(@ModelAttribute BoardVO boardVO) {
        boardService.update(boardVO);
        return "redirect:view?crtPage="+boardVO.getCrtPage()+"&no="+boardVO.getNo()+"&kwd="+boardVO.getKwd();

    }

    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public String del(@ModelAttribute BoardVO boardVO) {
        boardService.delete(boardVO);
        return "redirect:list?crtPage="+boardVO.getCrtPage();
    }
}
