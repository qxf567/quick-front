package com.shear.front.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quickshear.common.wechat.WechatManager;
import com.quickshear.common.wechat.domain.AccessToken;
import com.quickshear.domain.Shop;
import com.quickshear.service.ShopService;

@Controller
@RequestMapping("/shear")
public class IndexController extends AbstractController {

	private static final Logger LOGGER = LoggerFactory.getLogger(IndexController.class);

	@Autowired
	private ShopService shopService;
	@Autowired
	private WechatManager wechatManager;
	
	@RequestMapping("/index")
	public String index(Model model) {
	    
//	    String jsapi = wechatManager.getJsapiTicket();
//	    Shop shop = new Shop();
//	    
//	    String noncestr="Wm3WZYTPz0wzccnW";
//	    
//	    String timestamp = System.currentTimeMillis()+"";
//	    String sign = wechatManager.getSign(timestamp, noncestr);
//	    
//	    LOGGER.debug("enter...shear");
//	    model.addAttribute("jsapi", jsapi);
//	    
//	    model.addAttribute("timestamp", System.currentTimeMillis());
//	    model.addAttribute("sign", sign);
	    return "index";
	}

	@RequestMapping("/detail")
	public String detail() {
	    LOGGER.debug("enter...shear");
		return "detail";
	}

	@RequestMapping("/chose/time")
	public String chose() {
	    LOGGER.debug("enter...chose");
		return "chose_time";
	}
	
	@RequestMapping("/chose/hair")
	public String choseHair() {
	    LOGGER.debug("enter...chose");
		return "chose_hair";
	}
	
	
	@RequestMapping("/orderlist")
	public String list() {
	    LOGGER.debug("enter...chose");
		return "order_list";
	}
	/**
	 * 当url含有参数pid时，查找banner.id=pid的banner并回显到表单
	 * 
	 * @param id pid
	 * @param model
	 * @return 页面 banner_add.jsp
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(@RequestParam(required = false) String pid, Model model) {
		return "/banner/banner_add";
	}

}
