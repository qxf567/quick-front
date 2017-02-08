package com.shear.front.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quickshear.common.wechat.WechatConstat;
import com.quickshear.common.wechat.WechatManagerNew;
import com.quickshear.common.wechat.WechatUserInfoManager;
import com.quickshear.common.wechat.pay.TenpayConfig;
import com.quickshear.service.sms.StorageService;

@Controller
public class MenuController {

    @Autowired
    private WechatManagerNew manager;
    
    @Autowired
    private StorageService storage;
    
    @Autowired
    private WechatUserInfoManager infoManager;
    
    @RequestMapping("/menu/index")
    public String index() {
	String codeUrl = WechatConstat.codeUrl.replace("{appid}", TenpayConfig.app_id).replace("{redirect}",
		"http://m.qiansishun.com/shear/index");
	return "redirect:" + codeUrl;
    }
    
    @RequestMapping("/menu/order/list")
    public String order() {
	String codeUrl = WechatConstat.codeUrl.replace("{appid}", TenpayConfig.app_id).replace("{redirect}",
		"http://m.qiansishun.com/shear/order/list");
	return "redirect:" + codeUrl;
    }
    
    @RequestMapping("/menu/admin")
    public String admin(HttpServletResponse response,HttpServletRequest request) {
	String openid = storage.get(request, "openid");
	if(StringUtils.isBlank(openid)){
	    String codeUrl = WechatConstat.codeUrl.replace("{appid}", TenpayConfig.app_id).replace("{redirect}",
			"http://m.qiansishun.com/shear/admin");
		return "redirect:" + codeUrl;
	}else{
	    return "redirect:http://m.qiansishun.com:8280/admin/login/"+openid;
	}
	
    }
    
    @RequestMapping("/shear/admin")
    public String login(HttpServletResponse response,HttpServletRequest request,String code,String state,Model model) {
	String openid = manager.getWechatOpenIdByPageAccess(code);
	storage.set("openid",openid, response);
	return "redirect:http://m.qiansishun.com:8280/admin/login/"+openid;
    } 
    
    
    //创建菜单
    @RequestMapping("/open/create")
    @ResponseBody
    public String create() {
	String content = "{\"button\":[{\"type\":\"view\",\"name\":\"我要剪发\",\"url\":\"http://m.qiansishun.com/menu/index\"},{\"type\":\"view\",\"name\":\"我的订单\",\"url\":\"http://m.qiansishun.com/menu/order/list\"},{\"name\": \"更多\", \"sub_button\": [{\"type\":\"view\",\"name\":\"帮助中心\",\"url\":\"http://m.qiansishun.com/shear/about\"},{\"type\":\"view\",\"name\":\"员工通道\",\"url\":\"http://m.qiansishun.com/menu/admin\"}]}]}";
	int r =  manager.createMenu(content);
	return r+"";
    }
    
    //创建客服
    @RequestMapping("/open/create/kefu")
    @ResponseBody
    public String createKeFu() {
	String content = "{\"kf_account\" : \"qsskefu\",\"nickname\" : \"客服1\",\"password\" : \"qsskefu\"}";
	int r =  manager.createKeFu(content);
	return r+"1";
    }
    
}
