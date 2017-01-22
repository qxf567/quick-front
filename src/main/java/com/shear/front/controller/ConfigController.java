package com.shear.front.controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class ConfigController {
	private static final Logger LOGGER = LoggerFactory.getLogger(ConfigController.class);


    @RequestMapping("/MP_verify_IQbZCraCt328SjeF.txt")
    @ResponseBody
    public String jsDomainVerify() {
	return "IQbZCraCt328SjeF";
    }
    
    @RequestMapping("/")
    public String index0(HttpServletRequest request) {
    	LOGGER.info("enter index00");
    	if(check(request)){
    		return "index/mobile";
    	}else{
    		return "index/pc";
    	}
    }
    
    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
    	LOGGER.info("enter index");
    	if(check(request)){
    		return "index/mobile";
    	}else{
    		return "index/pc";
    	}
    }
    
    
    /** 
     * 检查访问方式是否为移动端 
     *  
     * @Title: check 
     * @param request 
     * @throws IOException  
     */  
    private boolean check(HttpServletRequest request) {  
        boolean isFromMobile=false;  
          
        HttpSession session= request.getSession();  
       //检查是否已经记录访问方式（移动端或pc端）  
        if(null==session.getAttribute("ua")){  
            try{  
                //获取ua，用来判断是否为移动端访问  
                String userAgent = request.getHeader( "USER-AGENT" ).toLowerCase();    
                if(null == userAgent){    
                    userAgent = "";    
                }  
                isFromMobile=check(userAgent);  
                //判断是否为移动端访问  
                if(isFromMobile){  
                    session.setAttribute("ua","mobile");  
                } else {  
                    session.setAttribute("ua","pc");  
                }  
            }catch(Exception e){}  
        }else{  
            isFromMobile=session.getAttribute("ua").equals("mobile");  
        }  
          
        return isFromMobile;  
    }  
    
    
    
   // \b 是单词边界(连着的两个(字母字符 与 非字母字符) 之间的逻辑上的间隔),    
   // 字符串在编译时会被转码一次,所以是 "\\b"    
   // \B 是单词内部逻辑间隔(连着的两个字母字符之间的逻辑上的间隔)    
   String phoneReg = "\\b(ip(hone|od)|android|opera m(ob|in)i"    
           +"|windows (phone|ce)|blackberry"    
           +"|s(ymbian|eries60|amsung)|p(laybook|alm|rofile/midp"    
           +"|laystation portable)|nokia|fennec|htc[-_]"    
           +"|mobile|up.browser|[1-4][0-9]{2}x[1-4][0-9]{2})\\b";    
   String tableReg = "\\b(ipad|tablet|(Nexus 7)|up.browser"    
           +"|[1-4][0-9]{2}x[1-4][0-9]{2})\\b";    
     
   //移动设备正则匹配：手机端、平板  
   Pattern phonePat = Pattern.compile(phoneReg, Pattern.CASE_INSENSITIVE);    
   Pattern tablePat = Pattern.compile(tableReg, Pattern.CASE_INSENSITIVE);    
       
   /** 
    * 检测是否是移动设备访问 
    *  
    * @Title: check 
    * @param userAgent 浏览器标识 
    * @return true:移动设备接入，false:pc端接入 
    */  
   private boolean check(String userAgent){    
       if(null == userAgent){    
           userAgent = "";    
       }    
       // 匹配    
       Matcher matcherPhone = phonePat.matcher(userAgent);    
       Matcher matcherTable = tablePat.matcher(userAgent);    
       if(matcherPhone.find() || matcherTable.find()){    
           return true;    
       } else {    
           return false;    
       }    
   }
}
