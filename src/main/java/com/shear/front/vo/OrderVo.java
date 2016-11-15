package com.shear.front.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 页面使用订单相关信息
 *
 */
public class OrderVo implements Serializable {
    /** 订单号 */
    private Long orderId;

    /** 顾客id */
    private Long customerId;
    
    private String openid;

    /** 顾客姓名 */
    private String customerName;

    /** 顾客联系电话 */
    private String customerNumber;

    /** 门店 */
    private String shopId;

    /** 发型师id */
    private Long hairdresserId;

    /** 发型id */
    private Long hairstyleId;
    
    /** 预约时间 */
    private String appointmentDay;
    /** 预约时间 */
    private String appointmentTime;

    /** 订单支付方式(0线下1微信) */
    private Integer payType;

    /** 订单状态(0待支付1支付完成100服务完成300取消) */
    private Integer orderStatus;

    /** 合计价格 */
    private BigDecimal totalPrice;

    /** 实际收费价格(默认为total_price) */
    private BigDecimal actualPrice;

    /** 下单时间 */
    private Date orderTime;

    /** 服务完成时间 */
    private Date serviceCompletionTime;

    /** 取消类型(1客户2后台管理) */
    private Integer cancelType;

    /** 取消原因 */
    private String cancelReason;

    /** 取消时间 */
    private Date cancelTime;

    /** 是否已评价(0否1是) */
    private Integer isEvaluate;


    private static final long serialVersionUID = 1L;

    public Long getOrderId() {
        return orderId;
    }

    public String getAppointmentDay() {
        return appointmentDay;
    }

    public void setAppointmentDay(String appointmentDay) {
        this.appointmentDay = appointmentDay;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerNumber() {
        return customerNumber;
    }

    public void setCustomerNumber(String customerNumber) {
        this.customerNumber = customerNumber;
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId;
    }

    public Long getHairdresserId() {
        return hairdresserId;
    }

    public void setHairdresserId(Long hairdresserId) {
        this.hairdresserId = hairdresserId;
    }

    public Long getHairstyleId() {
        return hairstyleId;
    }

    public void setHairstyleId(Long hairstyleId) {
        this.hairstyleId = hairstyleId;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public BigDecimal getActualPrice() {
        return actualPrice;
    }

    public void setActualPrice(BigDecimal actualPrice) {
        this.actualPrice = actualPrice;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Date getServiceCompletionTime() {
        return serviceCompletionTime;
    }

    public void setServiceCompletionTime(Date serviceCompletionTime) {
        this.serviceCompletionTime = serviceCompletionTime;
    }

    public Integer getCancelType() {
        return cancelType;
    }

    public void setCancelType(Integer cancelType) {
        this.cancelType = cancelType;
    }

    public String getCancelReason() {
        return cancelReason;
    }

    public void setCancelReason(String cancelReason) {
        this.cancelReason = cancelReason;
    }

    public Date getCancelTime() {
        return cancelTime;
    }

    public void setCancelTime(Date cancelTime) {
        this.cancelTime = cancelTime;
    }

    public Integer getIsEvaluate() {
        return isEvaluate;
    }

    public void setIsEvaluate(Integer isEvaluate) {
        this.isEvaluate = isEvaluate;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

}