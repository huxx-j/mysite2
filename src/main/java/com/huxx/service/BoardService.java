package com.huxx.service;

import com.huxx.dao.BoardDAO;
import com.huxx.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {

    @Autowired
    private BoardDAO boardDAO;

//    public List<BoardVO> selectList(BoardVO boardVO) {
//        int end = Integer.parseInt(boardVO.getNum()) * 5;
//        int begin = end - 4;
//        Map<String, Object> map = new HashMap<>();
//        map.put("end", end);
//        map.put("begin", begin);
//        map.put("kwd",boardVO.getKwd());
//        return boardDAO.search(map);
//    }

    public Map<String, Object> selectList(int crtPage, String kwd){
        crtPage = (crtPage<0)?(crtPage=1):crtPage;

        // 한페이지에 보여줄 게시글 개수
        int listCnt = 5;

        int endRnum = listCnt * crtPage;
        int startRnum = endRnum - (listCnt-1);

        Map<String, Object> search_Map = new HashMap<>();
        search_Map.put("startRnum", startRnum);
        search_Map.put("endRnum", endRnum);
        search_Map.put("kwd",kwd);

        List<BoardVO> list = boardDAO.search(search_Map);

        int totalCnt = boardDAO.totalCnt(kwd);

        int pageBtnCnt = 5;

        int endPageBtnNo = (int)(Math.ceil(crtPage/(double)pageBtnCnt)) * 5;
        int startPageBtnNo= endPageBtnNo - (pageBtnCnt-1);

        boolean next = false;
        if (endPageBtnNo * listCnt < totalCnt) { //이동할 페이지가 남아 있다면 보이게 처리
            next = true;
        } else { //이동할 페이지가 남아 있지 않으면 마지막 버튼 값 계산
            endPageBtnNo = (int) (Math.ceil(totalCnt / (double) listCnt));
        }

        boolean prev = false;
        if (startPageBtnNo != 1) {
            prev = true;
        }

        Map<String, Object> return_Map = new HashMap<>();
        return_Map.put("list", list);
        return_Map.put("kwd", kwd);
        return_Map.put("next", next);
        return_Map.put("prev",prev);
        return_Map.put("startPageBtnNo",startPageBtnNo);
        return_Map.put("endPageBtnNo", endPageBtnNo);

        return return_Map;
    }

    public void insert(BoardVO boardVO){
        boardDAO.insert(boardVO);
    }

    @Transactional
    public BoardVO selectView(String no) {
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
