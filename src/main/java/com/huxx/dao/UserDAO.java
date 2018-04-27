package com.huxx.dao;

import com.huxx.vo.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class UserDAO {

    @Autowired
    private SqlSession sqlSession;

    public int update(UserVO userVO) {
        return sqlSession.update("user.update",userVO);
    }

    public UserVO modifySelect(UserVO userVO) {
        return sqlSession.selectOne("user.modifySelect", userVO);
    }

    public int insert(UserVO userVO){
        return sqlSession.insert("user.insert",userVO);
    }

    public UserVO getUser(Map map) {
        return sqlSession.selectOne("user.getUser", map);
    }
}
