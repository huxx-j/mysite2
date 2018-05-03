package com.huxx.service;

import com.huxx.dao.GuestDAO;
import com.huxx.vo.GuestVO;
import com.huxx.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GuestService {

    @Autowired
    private GuestDAO guestDAO;

    public List<GuestVO> getList(){
        return guestDAO.getList();
    }
    public List<GuestVO> getInfinityList(int c){
        int end = c*5;
        int begin = end-4;
        Map<String, Object> map = new HashMap<>();
        map.put("end", end);
        map.put("begin", begin);
    return guestDAO.getInfinityList(map);
    }
    public void insert(GuestVO guestVO){
        guestDAO.insert(guestVO);
    }

    public GuestVO insert_ajax(GuestVO guestVO) {
        return guestDAO.select(guestDAO.insert(guestVO));
    }

    public int del_ajax(GuestVO guestVO) {
        int c = guestDAO.delete(guestVO);
        if(c>0) {
            return guestVO.getNo();
        } else {
            return 0;
        }
    }

    public void delete(GuestVO guestVO) {
        guestDAO.delete(guestVO);
    }


}
