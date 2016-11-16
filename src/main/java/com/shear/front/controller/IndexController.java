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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lashou.common.util.DateUtil;
import com.quickshear.common.wechat.WechatManager;
import com.quickshear.domain.Hairstyle;
import com.quickshear.domain.Shop;
import com.quickshear.domain.query.HairstyleQuery;
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

    @RequestMapping("/detail/{id}")
    public String detail(Model model,@PathVariable(value="id") Long id, @ModelAttribute OrderVo order) {
	Shop shop = null;
	try {
	    shop = shopService.findbyid(id);
	} catch (Exception e) {
	    e.printStackTrace();
	}
	model.addAttribute("shop", shop);
	model.addAttribute("order", order);
	return "shop/detail";
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
    public String choseHair(Model model,Shop shop, @ModelAttribute OrderVo order) {
	
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

    /**
     * 当url含有参数pid时，查找banner.id=pid的banner并回显到表单
     * 
     * @param id
     *            pid
     * @param model
     * @return 页面 banner_add.jsp
     */
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(@RequestParam(required = false) String pid, Model model) {
	return "/banner/banner_add";
    }

    public static List<Date> getDateList(Date date, String businessHours) {
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
