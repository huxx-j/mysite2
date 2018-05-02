package com.huxx.service;

import com.huxx.dao.UserDAO;
import com.huxx.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@Service
public class UserService {

    @Autowired
    private UserDAO userDAO;

    public void join(UserVO userVO) {
        int c = userDAO.insert(userVO);
        if(c>0) {
            System.out.println("가입 성공");
        } else {
            System.out.println("가입 실패");
        }
    }

    public UserVO login(String email, String password) {
        Map<String, Object> map = new HashMap<>();
        map.put("email", email);
        map.put("password", password);
        return userDAO.getUser(map);
    }

    public UserVO getUser(UserVO userVO) {
        return userDAO.modifySelect(userVO);
    }

    public void update(UserVO userVO){
        int c = userDAO.update(userVO);
        if (c>0) {
            System.out.println("Update Success!");
        } else {
            System.out.println("Update Fail!");
        }

    }

    public boolean emailCheck(String email) {
        boolean isExists = false;
        UserVO userVO = userDAO.emailCheck(email);
        if (userVO!=null) {
            isExists = true;
        }
        return isExists;
    }
}
