package com.shear.front.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jdom.JDOMException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quickshear.common.wechat.WechatManagerNew;
import com.quickshear.common.wechat.pay.util.HttpClientUtil;
import com.quickshear.common.wechat.pay.util.XMLUtil;
/**
 * <code>https://mp.weixin.qq.com/wiki/17/c0f37d5704f0b64713d5d2c37b468d75.html</code>
 * 
 * REDIRECT_URI设置为当前地址:shear/callback
 * 
 */
@Controller
@RequestMapping("/open")
public class WechatController extends AbstractController{
    
    @Autowired
    private WechatManagerNew manager;
    
    /**
     * 关注/取消关注事件
     * 
     */
    
    @RequestMapping("/watch")
    public String watch(@ModelAttribute Model model,HttpServletRequest request) {
	Map<String, String> map = new HashMap<String, String>();
	 InputStream in;
	 String openid= null;
	try {
	    in = request.getInputStream();
	    String res = HttpClientUtil.InputStreamTOString(in, "utf-8");
	    map = XMLUtil.doXMLParse(res);
	    openid=map.get("FromUserName");
	    model.addAttribute("openid", openid);
	} catch (IOException e) {
	    e.printStackTrace();
	} catch (JDOMException e) {
	    e.printStackTrace();
	}
	return "index";
    }
    /**
     * 上报地理位置事件
     * 
     */
    
    @RequestMapping("/report")
    public String report(@ModelAttribute Model model,HttpServletRequest request) {
	Map<String, String> map = new HashMap<String, String>();
	 InputStream in;
	 String openid= null;
	try {
	    in = request.getInputStream();
	    String res = HttpClientUtil.InputStreamTOString(in, "utf-8");
	    map = XMLUtil.doXMLParse(res);
	    openid=map.get("FromUserName");
	    model.addAttribute("openid", openid);
	    String latitude = map.get("Latitude");
	    String longitude = map.get("Longitude");
	    String precision = map.get("Precision");
	    model.addAttribute("latitude", latitude);
	    model.addAttribute("longitude", longitude);
	    model.addAttribute("precision", precision);
	} catch (IOException e) {
	    e.printStackTrace();
	} catch (JDOMException e) {
	    e.printStackTrace();
	}
	return "index";
    }
    
    
    
    /**
     * 关于网页授权回调地址
     * 
     * <p>
     * 1 第一步：用户同意授权，获取code
     * https://open.weixin.qq.com/connect/oauth2/authorize?appid
     * =APPID&redirect_uri
     * =REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect
     * </p>
     * <p>
     * 2 第二步：通过code换取网页授权access_token
     * https://api.weixin.qq.com/sns/oauth2/access_token
     * ?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
     * </p>
     * <p>
     * 3 第三步：刷新access_token（如果需要）
     * </p>
     * <p>
     * 4 第四步：拉取用户信息(需scope为 snsapi_userinfo)
     * </p>
     * 
     * <p>
     * 
     * <pre>
     * {
     *    "openid":" OPENID",
     *    " nickname": NICKNAME,
     *    "sex":"1",
     *    "province":"PROVINCE"
     *    "city":"CITY",
     *    "country":"COUNTRY",
     *     "headimgurl":    "<a href="http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/46" class="external free" rel="nofollow">http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/46</a>", 
     * 	"privilege":[
     * 	"PRIVILEGE1"
     * 	"PRIVILEGE2"
     *     ],
     *     "unionid": "o6_bmasdasdsad6_2sgVt7hMZOPfL"
     * }
     * </pre>
     * 
     * <table border="1" cellspacing="0" cellpadding="4" align="center">
     * <tr>
     * <th style="width:180px">参数</th>
     * <th style="width:470px">描述</th>
     * </tr>
     * <tr>
     * <td>openid</td>
     * <td>用户的唯一标识</td>
     * </tr>
     * <tr>
     * <td>nickname</td>
     * <td>用户昵称</td>
     * </tr>
     * <tr>
     * <td>sex</td>
     * <td>用户的性别，值为1时是男性，值为2时是女性，值为0时是未知</td>
     * </tr>
     * <tr>
     * <td>province</td>
     * <td>用户个人资料填写的省份</td>
     * </tr>
     * <tr>
     * <td>city</td>
     * <td>普通用户个人资料填写的城市</td>
     * </tr>
     * <tr>
     * <td>country</td>
     * <td>国家，如中国为CN</td>
     * </tr>
     * <tr>
     * <td>headimgurl</td>
     * <td>
     * 用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。
     * 若用户更换头像，原有头像URL将失效。</td>
     * </tr>
     * <tr>
     * <td>privilege</td>
     * <td>用户特权信息，json 数组，如微信沃卡用户为（chinaunicom）</td>
     * </tr>
     * <tr>
     * <td>unionid</td>
     * <td>只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。详见：<a href=
     * "https://open.weixin.qq.com/cgi-bin/frame?t=resource/res_main_tmpl&amp;lang=zh_CN&amp;target=res/app_wx_login"
     * class="external text" rel="nofollow">获取用户个人信息（UnionID机制）</a></td>
     * </tr>
     * </table>
     * <p>
     * <br />
     * 错误时微信会返回JSON数据包如下（示例为openid无效）:
     * </p>
     * 
     * <pre>
     * {"errcode":40003,"errmsg":" invalid openid "}
     * </pre>
     * 
     * </p>
     * <p>
     * 5 附：检验授权凭证（access_token）是否有效
     * </p>
     * 
     */
    @RequestMapping("/callback")
    public String callbak(@ModelAttribute Model model,String code,HttpServletRequest request) {
	
	Map<String,String> userMap = manager.getUser(request, code);
	model.addAttribute("openid", userMap.get("openid"));
	model.addAttribute("nickname", userMap.get("nickname"));
	model.addAttribute("city", userMap.get("city"));
	
	return "index";
    }
}
