package com.huxx.dao;

import com.huxx.vo.GuestVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GuestDAO {
    @Autowired
    private SqlSession sqlSession;

    public void insert(GuestVO guestVO){
        sqlSession.insert("guest.insert", guestVO);
    }

    public List<GuestVO> getList() {
        return sqlSession.selectList("guest.getList");
    }

    public void delete(GuestVO guestVO) {
        sqlSession.delete("guest.delete", guestVO);
    }

}
