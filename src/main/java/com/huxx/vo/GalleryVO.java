package com.huxx.vo;

public class GalleryVO {
    private String orgName;
    private String filePath;
    private String saveName;
    private long fileSize;
    private int no ;
    private String exName;

    public GalleryVO() {
    }

    public GalleryVO(String filePath, String orgName, String saveName, long fileSize) {
        this.orgName = orgName;
        this.filePath = filePath;
        this.saveName = saveName;
        this.fileSize = fileSize;
    }

    public GalleryVO(String orgName, String filePath, String saveName, long fileSize, int no, String exName) {
        this.orgName = orgName;
        this.filePath = filePath;
        this.saveName = saveName;
        this.fileSize = fileSize;
        this.no = no;
        this.exName = exName;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getSaveName() {
        return saveName;
    }

    public void setSaveName(String saveName) {
        this.saveName = saveName;
    }

    public long getFileSize() {
        return fileSize;
    }

    public void setFileSize(long fileSize) {
        this.fileSize = fileSize;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    @Override
    public String toString() {
        return "GalleryVO{" +
                "orgName='" + orgName + '\'' +
                ", filePath='" + filePath + '\'' +
                ", saveName='" + saveName + '\'' +
                ", fileSize=" + fileSize +
                ", no=" + no +
                '}';
    }
}
