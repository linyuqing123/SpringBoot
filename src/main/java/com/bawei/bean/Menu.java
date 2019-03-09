package com.bawei.bean;

public class Menu {

    private int mid;
    private int pid;
    private String mname;
    private String url;
    private String target;

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "mid=" + mid +
                ", pid=" + pid +
                ", mname='" + mname + '\'' +
                ", url='" + url + '\'' +
                ", target='" + target + '\'' +
                '}';
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }
}
