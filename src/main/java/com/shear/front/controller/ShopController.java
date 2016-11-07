package com.shear.front.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quickshear.domain.Shop;
import com.quickshear.service.ShopService;

@Controller
@RequestMapping("/shear/shop")
public class ShopController extends AbstractController {

	private static final Logger LOGGER = LoggerFactory.getLogger(ShopController.class);

//	@Autowired
//	private ShopService shopService;
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Shop> list(Model model) {
	    
	    Shop shop = new Shop();
	    shop.setName("望京店");
	    shop.setAddress("望京北路东口10号");
	    
	    
	    Shop s = new Shop();
	    s.setName("朝阳店");
	    s.setAddress("朝阳北路东口9999号");
	    List<Shop> list = new ArrayList<Shop>();
	    list.add(shop);
	    list.add(s);
	    return list;
	}

}
