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

@Controller
@RequestMapping(value = "/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model,@ModelAttribute BoardVO boardVO) {
        model.addAttribute("list",boardService.selectList(boardVO));
        return "board/list";
    }

    @RequestMapping(value = "/writeform", method = RequestMethod.GET)
    public String writeForm(){
        return "board/write";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(@ModelAttribute BoardVO boardVO){
        boardService.insert(boardVO);
        return "redirect:list?num=1&pc=1&kwd=";
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
        return "redirect:view?num="+boardVO.getNum()+"&no="+boardVO.getNo()+"&kwd="+boardVO.getKwd()+"&pc="+boardVO.getPc();

    }

    @RequestMapping(value = "/del", method = RequestMethod.GET)
    public String del(@ModelAttribute BoardVO boardVO) {
        boardService.delete(boardVO);
        return "redirect:list?num="+boardVO.getNum()+"&pc="+boardVO.getPc();
    }
}
