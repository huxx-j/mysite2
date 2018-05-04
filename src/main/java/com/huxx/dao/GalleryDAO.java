package com.huxx.dao;

import com.huxx.vo.GalleryVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GalleryDAO {

    @Autowired
    SqlSession sqlSession;

    public int upload(GalleryVO galleryVO) {
        return sqlSession.insert("gallery.insert",galleryVO);
    }

    public List<GalleryVO> getList(){
        return sqlSession.selectList("gallery.getList");
    }
}
