package com.shear.front.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quickshear.common.wechat.WechatManager;
import com.quickshear.domain.Shop;
import com.quickshear.domain.query.ShopQuery;
import com.quickshear.service.ShopService;
import com.shear.front.vo.OrderVo;

@Controller
@RequestMapping("/shear")
public class ShopController extends AbstractController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ShopController.class);

    @Autowired
    private ShopService shopService;
    @Autowired
    private WechatManager wechatManager;
    
    // 当前网页的URL，不包含#及其后面部分
    private String url = "http://m.qiansishun.com/shear/detail/";
    
    @RequestMapping(value = "/shop/list")
    @ResponseBody
    public List<Shop> list(Model model, Shop sh) {
	// 根据经纬度计算出geocode来查询
	List<Shop> shopList = null;
	ShopQuery query = new ShopQuery();
	query.setStatus(1);
	try {
	    shopList = shopService.selectByParam(query);
	} catch (Exception e) {
	    LOGGER.error("shop list:" + e);
	    e.printStackTrace();
	}
	return shopList;
    }

    @RequestMapping(value = "/detail/{id}", produces = "text/html;charset=UTF-8")
    public String detail(Model model, @PathVariable(value = "id") Long id, OrderVo order) {
	Shop shop = null;
	try {
	    shop = shopService.findbyid(id);
	} catch (Exception e) {
	    e.printStackTrace();
	}
	model.addAttribute("shop", shop);
	orderVoDecode(order);

	model.addAttribute("order", order);

	// 通过jsapi拿到经纬度
	String jsapi = wechatManager.getJsapiTicket();
	String timestamp = String.valueOf(System.currentTimeMillis() / 1000);
	String nonceStr = "Wm3WZY" + timestamp;
	String sign = wechatManager.getSign(timestamp, nonceStr, url+id);
	model.addAttribute("jsapi", jsapi);
	model.addAttribute("timestamp", timestamp);
	model.addAttribute("sign", sign);
	model.addAttribute("nonceStr", nonceStr);
	return "shop/detail";
    }

}
