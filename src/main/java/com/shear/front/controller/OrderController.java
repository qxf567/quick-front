package com.shear.front.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quickshear.common.pay.tenpay.AccessTokenUtil;
import com.quickshear.common.pay.tenpay.RequestHandler;
import com.quickshear.common.pay.tenpay.ResponseHandler;
import com.quickshear.common.pay.tenpay.TenpayConfig;
import com.quickshear.common.pay.tenpay.util.Sha1Util;
import com.quickshear.common.pay.tenpay.util.XMLUtil;
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

    /**
     * 微信支付回调接口
     * 
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/order/notify", method = RequestMethod.POST)
    public String tenpay(HttpServletRequest request, HttpServletResponse response) throws IOException {

	ResponseHandler resHandler = new ResponseHandler(request, response);
	resHandler.setKey(TenpayConfig.partner_key);
	InputStream is = request.getInputStream();
	BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
	String buffer = null;
	StringBuffer sb = new StringBuffer();
	while ((buffer = br.readLine()) != null) {
	    sb.append(buffer);
	}
	String notifyMessage = sb.toString();
	LOGGER.info("支付|notifyMessage=" + notifyMessage);
	resHandler.doParse(notifyMessage);

	Map<String, String> resultMap = new TreeMap<String, String>();

	if (resHandler.isTenpaySign()) {
	    // 商户订单号
	    String out_trade_no = resHandler.getParameter("out_trade_no");
	    // 财付通订单号
	    String transaction_id = resHandler.getParameter("transaction_id");

	    String return_code = resHandler.getParameter("return_code");

	    // 判断签名及结果
	    if ("SUCCESS".equals(return_code)) {

		Long orderId = Long.valueOf(out_trade_no);
		Order order = null;
		try {
		    order = orderService.findbyid(orderId);
		    if (order != null && order.getOrderStatus().equals(0)) {
			    order.setOrderStatus(1);
			    order.setCancelReason(transaction_id);
			    int r = orderService.update(order);
			    LOGGER.info("微信支付回调修改订单状态:" + order.getOrderId() + " result:" + r);
			} else {
			    LOGGER.info("微信支付回调修改订单状态不正确:" + order.getOrderId());
			}

		} catch (Exception e) {
		    e.printStackTrace();
		}
		
	    } else {
		LOGGER.error(String.format("微信支付异步回调|即时到账支付失败，订单号：%s,交易号：%s", out_trade_no, transaction_id));
		resultMap.put("return_code", "FAIL");
		resultMap.put("return_msg", "回调失败,return_code=" + return_code);
		return XMLUtil.map2Xml(resultMap);
	    }
	    resultMap.put("return_code", "SUCCESS");
	    resultMap.put("return_msg", "OK");
	    return XMLUtil.map2Xml(resultMap);
	} else {
	    LOGGER.error("微信支付异步回调|通知签名验证失败:" + resHandler.getParameter("return_msg"));
	    resultMap.put("return_code", "FAIL");
	    resultMap.put("return_msg", "签名验证失败");
	    return XMLUtil.map2Xml(resultMap);
	}
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
	    // 生成预支付单,【统一支付接口】参数
	    //地址： 地址： https://api.mch.weixin.qq.com/pay/unifiedorder
	    SortedMap<String, String> prePayParams = new TreeMap<String, String>();
	    
	    prePayParams.put("appid", TenpayConfig.app_id);
	    prePayParams.put("mch_id", TenpayConfig.mch_id);
	    prePayParams.put("nonce_str",Sha1Util.getNonceStr());
	    prePayParams.put("body", product_name); // 商品描述
	    prePayParams.put("out_trade_no", out_trade_no); // 商家订单号
	    prePayParams.put("total_fee", order_price); // 商品金额,以分为单位
	    prePayParams.put("spbill_create_ip", request.getRemoteAddr()); // 订单生成的机器IP，指用户浏览器端IP
	    prePayParams.put("notify_url", TenpayConfig.notify_url); // 接收微信通知的URL
	    prePayParams.put("trade_type", "JSAPI");
	    
	    prePayParams.put("openid",openid);
	   
	    String sign = reqHandler.createSign(prePayParams);
	    prePayParams.put("sign", sign);

	    // 获取prepayId
	    String prepayid = reqHandler.sendPrepay(prePayParams);

	    if (StringUtils.isNotBlank(prepayid)) {
		  //签名参数列表
		    SortedMap<String, String> payParams = new TreeMap<String, String>();
		    payParams.put("appid", TenpayConfig.app_id);
		    payParams.put("timestamp", Sha1Util.getTimeStamp());
		    payParams.put("noncestr", Sha1Util.getNonceStr());
		    payParams.put("package", "prepay_id=" + prepayid);
		    payParams.put("signType", "MD5");
		    String paySign = reqHandler.createSign(payParams);
		    payParams.put("paySign", paySign);

		    // 输出参数
		    tenpayPayVo.setRetCode("0");
		    tenpayPayVo.setRetMsg("OK");
		    TenpayPayInfoVo payInfoVo = new TenpayPayInfoVo();
		    payInfoVo.setAppId(payParams.get("appid"));
		    payInfoVo.setTimeStamp(payParams.get("timestamp"));
		    payInfoVo.setNonceStr(payParams.get("noncestr"));
		    payInfoVo.setPackageValue(payParams.get("package"));
		    payInfoVo.setSign(payParams.get("paySign"));
		    payInfoVo.setSignType(payParams.get("signType"));
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
