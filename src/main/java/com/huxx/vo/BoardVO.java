package com.huxx.vo;

public class BoardVO {
    private String no;
    private String title;
    private String content;
    private int hit;
    private String date;
    private String userNo;
    private String name;
    private String num;
    private String snum;
    private String tnum;
    private String kwd;
    private String pc;

    public String getPc() {
        return pc;
    }

    public void setPc(String pc) {
        this.pc = pc;
    }

    public String getTnum() {
        return tnum;
    }

    public void setTnum(String tnum) {
        this.tnum = tnum;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getSnum() {
        return snum;
    }

    public void setSnum(String snum) {
        this.snum = snum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BoardVO() {
    }

    public BoardVO(String no, String title, String content) {
        this.no = no;
        this.title = title;
        this.content = content;
    }

    public BoardVO(String title, String content, int hit, String userNo) {
        this.title = title;
        this.content = content;
        this.hit = hit;
        this.userNo = userNo;
    }

    public BoardVO(String no, String title, String content, int hit, String date, String userNo) {
        this.no = no;
        this.title = title;
        this.content = content;
        this.hit = hit;
        this.date = date;
        this.userNo = userNo;
    }

    public String getKwd() {
        return kwd;
    }

    public void setKwd(String kwd) {
        this.kwd = kwd;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getHit() {
        return hit;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }

    @Override
    public String toString() {
        return "BoardVO{" +
                "no='" + no + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", hit='" + hit + '\'' +
                ", date='" + date + '\'' +
                ", userNo='" + userNo + '\'' +
                '}';
    }
}
