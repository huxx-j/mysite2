package com.huxx.dao;

import com.huxx.vo.BoardVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardDAO {

    @Autowired
    private SqlSession sqlSession;

    public List<BoardVO> search2(BoardVO boardVO) {
        return sqlSession.selectList("board.search2", boardVO);
    }

    public List<BoardVO> selectPage(String num) {
        return sqlSession.selectList("board.selectPage", num);
    }

    public void delete(BoardVO boardVO) {
        sqlSession.delete("board.delete", boardVO);
    }

    public void updateHit(String no) {
        sqlSession.update("board.updateHit", no);
    }

    public BoardVO selectModify(String no) {
        return sqlSession.selectOne("board.selectModify", no);
    }

    public List<BoardVO> selectList(Map map) {
        return sqlSession.selectList("board.selectList", map);
    }

    public void update(BoardVO boardVO) {
        sqlSession.update("board.update", boardVO);
    }

    public void insert(BoardVO boardVO) {
        sqlSession.insert("board.insert", boardVO);
    }

    public BoardVO selectView(String no) {
        sqlSession.update("board.updateHit", no);
        return sqlSession.selectOne("board.selectView", no);
    }

}
