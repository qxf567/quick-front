package com.shear.front.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quickshear.common.vo.PageVo;
import com.quickshear.domain.Order;
import com.quickshear.domain.Shop;
import com.quickshear.domain.query.OrderQuery;
import com.quickshear.service.HairstyleService;
import com.quickshear.service.OrderService;
import com.quickshear.service.ShopService;
import com.shear.front.vo.OrderVo;

@Controller
@RequestMapping("/shear")
public class OrderController extends AbstractController {

    private static final Logger LOGGER = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private ShopService shopService;
    @Autowired
    private HairstyleService hairstyleService;
    @Autowired
    private OrderService orderService;

    @RequestMapping("/pay/detail")
    public String detail(Model model,@ModelAttribute OrderVo order) {
	
	Shop shop = null;
	try {
	    shop = shopService.findbyid(Long.valueOf(order.getShopId()));
	} catch (NumberFormatException e) {
	    e.printStackTrace();
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
	
	OrderQuery query = new OrderQuery();
	query.setShopId(order.getShopId());
	//支付完成
	query.setOrderStatus(1);
	
	try {
	    PageVo<Order>  pv = orderService.findByParam(query);
	    model.addAttribute("count", pv.getTotalCount());
	} catch (Exception e) {
	    e.printStackTrace();
	}
	
	//保存订单
	//@TODO
	
	
	model.addAttribute("shop", shop);
	model.addAttribute("order", order);
	return "order/detail";
    }

    
    @RequestMapping("/order/list")
    public String list(Model model,Long customerId) {
	
	
	OrderQuery query = new OrderQuery();
	query.setCustomerId(customerId);
	//支付完成
	//query.setOrderStatus(1);
	List<Order>  orderList = null;
	try {
	    orderList = orderService.selectByParam(query);
	} catch (Exception e) {
	    e.printStackTrace();
	}
	
	model.addAttribute("orderList", orderList);
	return "order/list";
    }
    
}
