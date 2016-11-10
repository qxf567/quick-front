package com.shear.front.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quickshear.domain.Shop;
import com.quickshear.domain.query.ShopQuery;
import com.quickshear.service.ShopService;

@Controller
@RequestMapping("/shear/shop")
public class ShopController extends AbstractController {

	private static final Logger LOGGER = LoggerFactory.getLogger(ShopController.class);

	@Autowired
	private ShopService shopService;
	
	@RequestMapping(value = "/list")
	@ResponseBody
	public List<Shop> list(Model model,Shop sh) {
	    //根据经纬度计算出geocode来查询
	    List<Shop> shopList = null;
	    ShopQuery query = new ShopQuery();
	    query.setStatus(1);
	    try {
		shopList = shopService.selectByParam(query);
	    } catch (Exception e) {
		LOGGER.error("shop list:"+e);
		e.printStackTrace();
	    }
	    return shopList;
	}

}
