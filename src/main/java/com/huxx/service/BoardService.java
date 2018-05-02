package com.huxx.service;

import com.huxx.dao.BoardDAO;
import com.huxx.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {

    @Autowired
    private BoardDAO boardDAO;

    public List<BoardVO> selectList(BoardVO boardVO) {
        int end = Integer.parseInt(boardVO.getNum()) * 5;
        int begin = end - 4;
        Map<String, Object> map = new HashMap<>();
        map.put("end", end);
        map.put("begin", begin);
        map.put("kwd",boardVO.getKwd());
        return boardDAO.search(map);
    }

    public void insert(BoardVO boardVO){
        boardDAO.insert(boardVO);
    }

    public BoardVO selectView(String no) { //
        boardDAO.updateHit(no);
        return boardDAO.selectView(no);
    }

    public BoardVO selectModify(String no) {
        return boardDAO.selectModify(no);
    }

    public void update(BoardVO boardVO) {
        boardDAO.update(boardVO);
    }

    public void delete(BoardVO boardVO) {
        boardDAO.delete(boardVO);
    }
}
