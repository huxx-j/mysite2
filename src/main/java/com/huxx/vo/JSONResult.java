package com.huxx.vo;

public class JSONResult {
    private String result;
    private String failMsg;
    private Object data;

    public JSONResult() {
    }

    public JSONResult(String result, String failMsg, Object data) {
        this.result = result;
        this.failMsg = failMsg;
        this.data = data;
    }

    public void success(Object data){
        this.result = "success";
        this.failMsg = null;
        this.data = data;
    }

    public void fail(String failMsg){
        this.result = "fail";
        this.failMsg = failMsg;
        this.data = null;
    }


}
