package com.shear.front.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quickshear.common.pay.tenpay.AccessTokenUtil;
import com.quickshear.common.pay.tenpay.RequestHandler;
import com.quickshear.common.pay.tenpay.TenpayConfig;
import com.quickshear.common.pay.tenpay.util.Sha1Util;
import com.quickshear.common.vo.PageVo;
import com.quickshear.domain.Order;
import com.quickshear.domain.Shop;
import com.quickshear.domain.query.OrderQuery;
import com.quickshear.service.HairstyleService;
import com.quickshear.service.OrderService;
import com.quickshear.service.ShopService;
import com.shear.front.vo.OrderVo;
import com.shear.front.vo.TenpayPayInfoVo;
import com.shear.front.vo.TenpayPayVo;

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

    @Autowired
    private AccessTokenUtil accessTokenUtil;

    @RequestMapping("/order/prepay")
    public String detail(Model model, @ModelAttribute OrderVo order,HttpServletRequest request, HttpServletResponse response) {

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
	// 支付完成
	query.setOrderStatus(1);

	try {
	    PageVo<Order> pv = orderService.findByParam(query);
	    model.addAttribute("count", pv.getTotalCount());
	} catch (Exception e) {
	    e.printStackTrace();
	}

	// 保存订单
	// @TODO
	
	model.addAttribute("shop", shop);
	model.addAttribute("order", order);
	return "order/prepay";
    }
    
    
    @RequestMapping("/order/pay")
    @ResponseBody
    public TenpayPayVo prepay(Long orderId,String openid,HttpServletRequest request, HttpServletResponse response) {

	 TenpayPayVo payVo = null;
	try {
	    Order order = orderService.findbyid(orderId);
	    payVo = generateOrderInfoOfTenpay(order,openid,request,response);	
	} catch (Exception e) {
	    e.printStackTrace();
	}
	return payVo;
    }

    @RequestMapping("/order/list")
    public String list(Model model, Long customerId) {

	OrderQuery query = new OrderQuery();
	query.setCustomerId(customerId);
	// 支付完成
	// query.setOrderStatus(1);
	List<Order> orderList = null;
	try {
	    orderList = orderService.selectByParam(query);
	} catch (Exception e) {
	    e.printStackTrace();
	}

	model.addAttribute("orderList", orderList);
	return "order/list";
    }

    /**
     * 生成tenpay的订单支付信息
     * @param orderVo
     * @param request
     * @param response
     * @return
     */
    private TenpayPayVo generateOrderInfoOfTenpay(Order order,String openid, HttpServletRequest request, HttpServletResponse response) {

	String out_trade_no = order.getOrderId() + "";
	// 获取提交的商品价格
	String order_price = order.getTotalPrice().multiply(new BigDecimal("100")).setScale(0) + "";
	// 获取提交的商品名称
	String product_name = StringUtils.abbreviate(order.getHairstyleId() + "", 128);
	// String product_name = request.getParameter("product_name");
	TenpayPayVo tenpayPayVo = new TenpayPayVo();
	RequestHandler reqHandler = new RequestHandler(request, response);
	reqHandler.setKey(TenpayConfig.partner_key);
	reqHandler.setGateUrl(TenpayConfig.prepay_url);
	// 获取token值
	String token = accessTokenUtil.getAccessToken();
	if (StringUtils.trimToNull(token) != null) {
	    // 生成预支付单
	    // 设置package订单参数
	    SortedMap<String, String> params = new TreeMap<String, String>();
	    
	    params.put("appid", TenpayConfig.app_id);
	    params.put("mch_id", TenpayConfig.mch_id);
	    params.put("nonce_str",Sha1Util.getNonceStr());
	    params.put("body", product_name); // 商品描述
	    params.put("out_trade_no", out_trade_no); // 商家订单号
	    params.put("total_fee", order_price); // 商品金额,以分为单位
	    params.put("spbill_create_ip", request.getRemoteAddr()); // 订单生成的机器IP，指用户浏览器端IP
	    params.put("notify_url", TenpayConfig.notify_url); // 接收财付通通知的URL
	    params.put("trade_type", "JSAPI");
	    
	    params.put("openid",openid);
	   
	    String sign = reqHandler.createSign(params);
	    params.put("sign", sign);

	    // 获取prepayId
	    String prepayid = reqHandler.sendPrepay(params);

	    if (StringUtils.isNotBlank(prepayid)) {
		  //签名参数列表
		    SortedMap<String, String> prePayParams = new TreeMap<String, String>();
		    prePayParams.put("appid", TenpayConfig.app_id);
		    prePayParams.put("timestamp", Sha1Util.getTimeStamp());
		    prePayParams.put("noncestr", Sha1Util.getNonceStr());
		    prePayParams.put("package", "prepay_id=" + prepayid);
		    prePayParams.put("signType", "MD5");
		    String paySign = reqHandler.createSign(prePayParams);
		    prePayParams.put("paySign", paySign);

		    // 输出参数
		    tenpayPayVo.setRetCode("0");
		    tenpayPayVo.setRetMsg("OK");
		    TenpayPayInfoVo payInfoVo = new TenpayPayInfoVo();
		    payInfoVo.setAppId(prePayParams.get("appid"));
		    payInfoVo.setTimeStamp(prePayParams.get("timestamp"));
		    payInfoVo.setNonceStr(prePayParams.get("noncestr"));
		    payInfoVo.setPackageValue(prePayParams.get("package"));
		    payInfoVo.setSign(prePayParams.get("paySign"));
		    payInfoVo.setSignType(prePayParams.get("signType"));
		    String userAgent = request.getHeader("user-agent");
		    char agent = userAgent.charAt(userAgent.indexOf("MicroMessenger") + 15);
		    payInfoVo.setAgent(new String(new char[] { agent }));// 微信版本号，用于前面提到的判断用户手机微信的版本是否是5.0以上版本。
		    tenpayPayVo.setPayInfo(payInfoVo);
		    
		} else {
		    LOGGER.error(String.format("get prepayid err ,info = %s", prepayid));
		    tenpayPayVo.setRetCode("-2");
		    tenpayPayVo.setRetMsg("错误：获取prepayId失败");
		}
		
	} else {
	    tenpayPayVo.setRetCode("-1");
	    tenpayPayVo.setRetMsg("错误：获取不到Token");
	}
	return tenpayPayVo;
    }

}
