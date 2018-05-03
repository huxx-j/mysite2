package com.huxx.dao;

import com.huxx.vo.GuestVO;
import com.huxx.vo.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GuestDAO {

    @Autowired
    private SqlSession sqlSession;

    public int insert(GuestVO guestVO){
         sqlSession.insert("guest.insert", guestVO);
         return guestVO.getNo();
    }

    public List<GuestVO> getList() {
        return sqlSession.selectList("guest.getList");
    }

    public List<GuestVO> getInfinityList(Map map) {
        return sqlSession.selectList("guest.getList_Scroll", map);
    }


    public int delete(GuestVO guestVO) {
        return sqlSession.delete("guest.delete", guestVO);
    }

    public GuestVO select(int no) {
        return sqlSession.selectOne("guest.select", no);
    }
}
