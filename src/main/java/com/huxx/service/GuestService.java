package com.huxx.service;

import com.huxx.dao.GuestDAO;
import com.huxx.vo.GuestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GuestService {

    @Autowired
    private GuestDAO guestDAO;

    public List<GuestVO> getList(){
        return guestDAO.getList();
    }

    public void insert(GuestVO guestVO){
        guestDAO.insert(guestVO);
    }

    public void delete(GuestVO guestVO) {
        guestDAO.delete(guestVO);
    }
}
