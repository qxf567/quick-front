package com.shear.front.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quickshear.common.util.DateUtil;
import com.quickshear.common.wechat.WechatManager;
import com.quickshear.domain.Hairdresser;
import com.quickshear.domain.Hairstyle;
import com.quickshear.domain.Shop;
import com.quickshear.domain.query.HairdresserQuery;
import com.quickshear.domain.query.HairstyleQuery;
import com.quickshear.service.HairdresserService;
import com.quickshear.service.HairstyleService;
import com.quickshear.service.ShopService;
import com.shear.front.vo.OrderVo;

@Controller
@RequestMapping("/shear")
public class IndexController extends AbstractController {

    private static final Logger LOGGER = LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private ShopService shopService;
    @Autowired
    private WechatManager wechatManager;
    @Autowired
    private HairstyleService hairstyleService;
    @Autowired
    private HairdresserService hairdresserService;

    // 当前网页的URL，不包含#及其后面部分
    private String url = "http://qa-n.lashou.com/shear/shear/index";

    @RequestMapping("/index")
    public String index(Model model) {

	String jsapi = wechatManager.getJsapiTicket();

	String timestamp = String.valueOf(System.currentTimeMillis() / 1000);
	String nonceStr = "Wm3WZY" + timestamp;
	String sign = wechatManager.getSign(timestamp, nonceStr, url);

	LOGGER.debug("enter...shear");
	model.addAttribute("jsapi", jsapi);
	LOGGER.debug("enter...jsapi" + jsapi);
	model.addAttribute("timestamp", timestamp);
	model.addAttribute("sign", sign);
	model.addAttribute("nonceStr", nonceStr);

	return "index";
    }
    
    @RequestMapping("/about")
    public String about(Model model) {
	
	return "about";
    }


    @RequestMapping("/chose/time")
    public String chose(Model model,Shop shop, @ModelAttribute OrderVo order) {

	Map<Date, List<Date>> avaiDate = new TreeMap<Date, List<Date>>();

	// 将具体的日期转成相关的日
	// 将不可使用的时间段放入
	List<String> todayList = new ArrayList<String>();
	todayList.add("18:00");
	todayList.add("18:30");

	String businessHours = shop.getBusinessHours();
	//String businessHours = "10:00-22:00";
	Date date = new Date();
	for (int i = 1; i < 6; i++) {
	    model.addAttribute("t" + i, date);
	    List<Date> dateList = getDateList(date, businessHours);
	    avaiDate.put(date, dateList);
	    date = DateUtil.getDate(date, 1);
	}
	model.addAttribute("avaiDate", avaiDate);
	model.addAttribute("order", order);
	return "chose_time";
    }

    @RequestMapping("/chose/hair")
    public String choseHair(Model model, @ModelAttribute OrderVo order) {
	
	HairstyleQuery query = new HairstyleQuery();
	//query.setStatus(1);
	List<Hairstyle> hairList = null;
	try {
	    hairList = hairstyleService.selectByParam(query);
	} catch (Exception e) {
	    e.printStackTrace();
	}
	model.addAttribute("hairList", hairList);
	model.addAttribute("order", order);
	return "chose_hair";
    }
    
    @RequestMapping("/chose/dresser")
    public String choseHairDresser(Model model, @ModelAttribute OrderVo order) {
	
	HairdresserQuery query = new HairdresserQuery();
	query.setStatus(1);
	query.setShopId(Long.valueOf(order.getShopId()));
	List<Hairdresser> list = null;
	try {
	    list = hairdresserService.selectByParam(query);
	} catch (Exception e) {
	    e.printStackTrace();
	}
	model.addAttribute("dresserList", list);
	model.addAttribute("order", order);
	return "chose_dresser";
    }
    
    @RequestMapping("/chose/hair/detail")
    public String choseHairDetail(Model model,Shop shop, @ModelAttribute OrderVo order,Long hairstyleId) {
	Hairstyle hair = null;
	try {
	    hair = hairstyleService.findbyid(hairstyleId);
	} catch (Exception e) {
	    e.printStackTrace();
	}
	model.addAttribute("hair", hair);
	model.addAttribute("order", order);
	return "hair_detail";
    }

    @RequestMapping("/orderlist")
    public String list() {
	LOGGER.debug("enter...chose");
	return "order_list";
    }


    private List<Date> getDateList(Date date, String businessHours) {
	String[] buss = businessHours.split("-");
	String start = DateUtil.format(date, DateUtil.YYYY_MM_DD) + " " + buss[0] + ":00";
	String end = DateUtil.format(date, DateUtil.YYYY_MM_DD) + " " + buss[1] + ":00";

	List<Date> list = new ArrayList<Date>();

	Date startD = DateUtil.parse(start, DateUtil.ALL);
	Date endD = DateUtil.parse(end, DateUtil.ALL);
	Calendar s = Calendar.getInstance();
	s.setTime(startD);

	list.add(startD);
	// System.out.println(s.getTime().compareTo(endD)<0);
	while (s.getTime().compareTo(endD) < 0) {
	    s.set(Calendar.MINUTE, s.get(Calendar.MINUTE) + 30);
	    list.add(s.getTime());
	}
	list.remove(list.size() - 1);

	return list;
    }
    
}
