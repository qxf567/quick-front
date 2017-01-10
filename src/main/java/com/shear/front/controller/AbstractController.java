/**
 * AbstractController.java
 * Copyright (c) 2013 by lashou.com
 */
package com.shear.front.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.quickshear.common.config.ShearConfig;
import com.quickshear.service.sms.StorageService;
import com.shear.front.vo.OrderVo;

/**
 * abstract
 * 
 */

public abstract class AbstractController {

    /** LOOGER */
    private Logger LOGGER = LoggerFactory.getLogger(AbstractController.class);

    @Autowired
    protected ShearConfig config;

    @Autowired
    private StorageService storage;
    /**
     * set
     * 
     * @param model
     * @param request
     */
    @ModelAttribute
    public void modelAttribute(Model model, HttpServletRequest request) {
        model.addAttribute("debug", config.getEnv().equals("live")?false:true);
        model.addAttribute("appid", config.getAppId());
        model.addAttribute("appsecret", config.getAppSecret());
        String v = storage.get();
        if(StringUtils.isNotBlank(v)){
            String []vv = v.split(":");
            model.addAttribute("openid", vv[1]);
            LOGGER.info("openid:"+vv[1]);
        }else{
            //@TODO
            model.addAttribute("openid", "openidtttttt");
        }
        
    }

    
    public void orderVoDecode(OrderVo order){
	try {
	    if (StringUtils.isNotBlank(order.getHairstyleName())) {
		String name = URLDecoder.decode(order.getHairstyleName(),"utf-8");
		order.setHairstyleName(name);
	    }
	    if (StringUtils.isNotBlank(order.getHairdresserName())) {
		String hairName = URLDecoder.decode(order.getHairdresserName(), "UTF-8");
		order.setHairdresserName(hairName);
	    }
	    if (StringUtils.isNotBlank(order.getAppointmentDay())) {
		order.setAppointmentDay(URLDecoder.decode(order.getAppointmentDay(), "UTF-8"));
	    }
	    if (StringUtils.isNotBlank(order.getAppointmentTime())) {
		order.setAppointmentTime(URLDecoder.decode(order.getAppointmentTime(), "UTF-8"));
	    }

	} catch (UnsupportedEncodingException e) {
	    e.printStackTrace();
	}
    }
    
    /**
     * 随机产生密码
     * 
     * @param length
     *            生产的长度
     */
    protected String getRandomCode(int length) {
	String str = "0123456789";
	Random random = new Random();
	StringBuffer sb = new StringBuffer();
	for (int i = 0; i < length; i++) {
	    int number = random.nextInt(10);
	    sb.append(str.charAt(number));
	}
	return sb.toString();
    }
    
}
