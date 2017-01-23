package com.shear.front.vo;

import com.quickshear.common.base.BasePo;

public class TenpayPayVo extends BasePo {

    private String retCode;
    private String retMsg;
    private String orderId;
    private TenpayPayInfoVo payInfo;

    public String getOrderId() {
	return orderId;
    }

    public void setOrderId(String orderId) {
	this.orderId = orderId;
    }

    public String getRetCode() {
	return retCode;
    }

    public void setRetCode(String retCode) {
	this.retCode = retCode;
    }

    public String getRetMsg() {
	return retMsg;
    }

    public void setRetMsg(String retMsg) {
	this.retMsg = retMsg;
    }

    public TenpayPayInfoVo getPayInfo() {
	return payInfo;
    }

    public void setPayInfo(TenpayPayInfoVo payInfo) {
	this.payInfo = payInfo;
    }

}
