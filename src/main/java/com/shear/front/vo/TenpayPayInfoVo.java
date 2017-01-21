package com.shear.front.vo;

import com.quickshear.common.base.BasePo;

public class TenpayPayInfoVo  extends BasePo{

    private String appId;
    private String agent;
    private String nonceStr;
    private String packageValue;
    private String signType;
    private String timeStamp;
    private String sign;

    public String getAppId() {
	return appId;
    }

    public void setAppId(String appId) {
	this.appId = appId;
    }

    public String getAgent() {
	return agent;
    }

    public void setAgent(String agent) {
	this.agent = agent;
    }

    public String getNonceStr() {
	return nonceStr;
    }

    public void setNonceStr(String nonceStr) {
	this.nonceStr = nonceStr;
    }

    public String getPackageValue() {
	return packageValue;
    }

    public void setPackageValue(String packageValue) {
	this.packageValue = packageValue;
    }

    public String getSignType() {
	return signType;
    }

    public void setSignType(String signType) {
	this.signType = signType;
    }

    public String getTimeStamp() {
	return timeStamp;
    }

    public void setTimeStamp(String timeStamp) {
	this.timeStamp = timeStamp;
    }

    public String getSign() {
	return sign;
    }

    public void setSign(String sign) {
	this.sign = sign;
    }

}
