package com.huxx.vo;

public class GuestVO {
    private String no;
    private String name;
    private String password;
    private String content;
    private String reg_date;

    public GuestVO() {
    }

    public GuestVO(String name, String password, String content) {
        this.name = name;
        this.password = password;
        this.content = content;
    }

    public GuestVO(String no, String name, String password, String content, String reg_date) {
        this.no = no;
        this.name = name;
        this.password = password;
        this.content = content;
        this.reg_date = reg_date;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getReg_date() {
        return reg_date;
    }

    public void setReg_date(String reg_date) {
        this.reg_date = reg_date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
