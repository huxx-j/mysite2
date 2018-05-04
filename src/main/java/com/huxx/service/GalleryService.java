package com.huxx.service;

//import com.huxx.dao.FileUploadDAO;
import com.huxx.dao.GalleryDAO;
import com.huxx.vo.GalleryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

@Service
public class GalleryService {

    @Autowired
    GalleryDAO galleryDAO;

    public List<GalleryVO> getList(){
        return galleryDAO.getList();
    }

    public void restore(MultipartFile file) {
        String saveDir = "/Users/huxx_j/Documents/upload";
        //오리지날 파일명
        String orgName = file.getOriginalFilename();
        //확장자
        String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        //저장파일명
        String saveName = System.currentTimeMillis()+ "_" + UUID.randomUUID().toString()+ "_" + orgName; //임의의 난수를 주는데 겹칠수도 있으니 시간을 추가해줌
        //파일패스
        String filePath = saveDir+"/"+orgName;
        //파일사이즈
        long fileSize = file.getSize();

        GalleryVO galleryVO = new GalleryVO(filePath,orgName,saveName,fileSize);

        //다오 연결 디비 저장
        int c= galleryDAO.upload(galleryVO);

        if(c >0) {
            System.out.println("업로드 성공");
        } else {
            System.out.println("업로드 실패");
        }
        //파일서버 복사
        try {
            byte[] fileData = file.getBytes();
            OutputStream outputStream = new FileOutputStream(saveDir+"/"+saveName);
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream);
            bufferedOutputStream.write(fileData);
            if (bufferedOutputStream != null) { //파일쓰기가 끝나고 연결이 돼있으면 연결을 끊는거
                bufferedOutputStream.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}