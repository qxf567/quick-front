/**
 * AbstractController.java
 * Copyright (c) 2013 by lashou.com
 */
package com.shear.front.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.context.request.WebRequest;

import com.quickshear.common.config.ShearConfig;

/**
 * abstract
 * 
 */
public abstract class AbstractController {

    /** LOOGER */
    private Logger LOGGER = LoggerFactory.getLogger(AbstractController.class);

    @Autowired
    protected ShearConfig config;

    /**
     * set
     * 
     * @param model
     * @param request
     */
    @ModelAttribute
    public void modelAttribute(Model model, WebRequest request) {
        model.addAttribute("debug", config.getEnv().equals("live")?false:true);
        model.addAttribute("appid", config.getAppId());
        model.addAttribute("appsecret", config.getAppSecret());
        //@TODO  
    }

//    /**
//     * 获取当前用户登录ID
//     * 
//     * @return
//     */
//    protected int getUserId() {
//        User u = (User) SecurityContextHolder.getContext().getAuthentication()
//                .getPrincipal();
//        return Integer.parseInt(u.getUsername());
//    }
//
//    /**
//     * 获取当前系统登录用户
//     * 
//     * @return
//     * @throws BusinessException
//     */
//    protected com.lashou.common.auth.domain.User getUser(int userId)
//            throws BusinessException {
//        List<com.lashou.common.auth.domain.User> userList = securityManagement
//                .findUser(null, userId, null, null, null, null, null, null,
//                        null);
//        if (userList == null || userList.size() == 0) {
//            LOGGER.warn(String.format("用户%s不存在", userId));
//            throw new BusinessException(String.format("用户%s不存在", userId));
//        }
//        if (userList.size() > 1) {
//            LOGGER.warn(String.format("用户%s数据异常", userId));
//            throw new BusinessException(String.format("用户%s数据异常", userId));
//        }
//        if (!userList.get(0).isStatus()) {
//            LOGGER.warn(String.format("用户%s已禁用", userId));
//            throw new BusinessException(String.format("用户%s已禁用", userId));
//        }
//        return userList.get(0);
//    }
//    
//    /**
//     * 获取当前系统登录用户
//     * 
//     * @return
//     * @throws BusinessException
//     */
//    public com.lashou.common.auth.domain.User getUser()
//            throws BusinessException {
//        List<com.lashou.common.auth.domain.User> userList = securityManagement
//                .findUser(null, this.getUserId(), null, null, null, null, null, null,
//                        null);
//        if (userList == null || userList.size() == 0) {
//            LOGGER.warn(String.format("用户%s不存在", this.getUserId()));
//            throw new BusinessException(String.format("用户%s不存在", this.getUserId()));
//        }
//        if (userList.size() > 1) {
//            LOGGER.warn(String.format("用户%s数据异常", this.getUserId()));
//            throw new BusinessException(String.format("用户%s数据异常", this.getUserId()));
//        }
//        if (!userList.get(0).isStatus()) {
//            LOGGER.warn(String.format("用户%s已禁用", this.getUserId()));
//            throw new BusinessException(String.format("用户%s已禁用", this.getUserId()));
//        }
//        return userList.get(0);
//    }
//
//    /**
//     * 获取用户的菜单列表
//     * 
//     * @return
//     */
//    private List<com.lashou.common.auth.domain.Model> getModel() {
//        return securityManagement.findModelByParam(null, true, null, null,
//                "id asc");
//    }
//
//    /**
//     * 获取用户的资源列表，不重复的
//     * 
//     * @return
//     */
//    private TreeSet<Resource> getResource(int userId) {
//        TreeSet<Resource> resources = new TreeSet<Resource>();
//        List<com.lashou.common.auth.domain.Role> roles = securityManagement
//                .findRolesByUserId(userId, null, null, null);
//        if (roles == null) {
//            return null;
//        }
//        for (com.lashou.common.auth.domain.Role role : roles) {
//            List<Resource> res = securityManagement
//                    .findDisplayResourceByRoleId(role.getId());
//            if (res != null) {
//                resources.addAll(res);
//            }
//
//        }
//        resources.comparator();
//        return resources;
//    }
//    /**
//     * 获取资源Id字符串
//     * 
//     * @return
//     */
//    protected String getResourceIds(int i) {
//        StringBuilder sb = new StringBuilder();
//        List<com.lashou.common.auth.domain.Role> roles = securityManagement
//                .findRolesByUserId(i, null, null, null);
//        if (roles == null) {
//            return null;
//        }
//        for (com.lashou.common.auth.domain.Role role : roles) {
//            sb.append(role.getResourceIds()).append(",");
//        }
//        return sb.toString();
//    }
//
//    /**
//     * is AJAX request
//     * 
//     * @param request
//     * @return
//     */
//    @ModelAttribute("ajaxRequest")
//    public Boolean ajaxAttribute(WebRequest request) {
//        return AjaxUtil.isAjaxRequest(request);
//    }
//
//    /**
//     * 逗号分割的字符串转long数组
//     * 
//     * @param str
//     * @return
//     */
//    protected Long[] toLongArr(String str) {
//        if (StringUtils.isBlank(str)) {
//            return null;
//        }
//        String[] items = str.split(",");
//        Long[] results = new Long[items.length];
//        for (int i = 0; i < items.length; i++) {
//            try {
//                results[i] = Long.parseLong(items[i]);
//            } catch (NumberFormatException nfe) {
//                // ignore
//            }
//        }
//        return results;
//    }
//
//    /**
//     * bad parameters request default handler
//     * 
//     * @param ex
//     *            bad parameters request
//     * @return
//     */
//    // @ExceptionHandler(BindException.class)
//    // @ResponseStatus(value = HttpStatus.BAD_REQUEST)
//    // @ResponseBody
//    // public String handleBindException(BindException ex) {
//    // return ex.getMessage();
//    // }
//
//    /**
//     * bad request
//     * 
//     * @author Brody Cai
//     * 
//     */
//    // @ResponseStatus(value = HttpStatus.BAD_REQUEST)
//    // public static class BadParamsException extends RuntimeException {
//    // /**
//    // *
//    // */
//    // private static final long serialVersionUID = 3810642058797342483L;
//    //
//    // /**
//    // * constructor
//    // *
//    // * @param errorMessage
//    // * error message
//    // */
//    // public BadParamsException(final String errorMessage) {
//    // super(errorMessage);
//    // }
//    // }
//
//    /**
//     * 判断当前是否拥有该权限
//     * 
//     * @param roleId
//     *            角色ID
//     * @return
//     * @throws BusinessException
//     */
//    public boolean checkRoleByRoleId(String roleId) throws BusinessException {
//        String ids = this.getUser(this.getUserId()).getRoleIds();
//        if (StringUtils.isNotBlank(ids)) {
//            return ("," + ids + ",").indexOf("," + roleId + ",") >= 0;
//        }
//        return false;
//    }
//    /**
//     * 判断当前是否拥有该权限
//     * 
//     * @param groupId 组
//     * @return
//     * @throws BusinessException
//     */
//    public boolean checkRoleByGroupId(String groupId) throws BusinessException {
//        String ids = this.getUser(this.getUserId()).getGroupIds();
//        if (StringUtils.isNotBlank(ids)) {
//            return ("," + ids + ",").indexOf("," + groupId + ",") >= 0;
//        }
//        return false;
//    }
//
//    /**
//     * 获取当前用户关联的角色
//     * 
//     * @return
//     */
//    public String getRoles(int i) {
//        List<com.lashou.common.auth.domain.Role> roles = securityManagement
//                .findRolesByUserId(i, null, null, null);
//
//        StringBuilder sb = new StringBuilder();
//        if (roles != null && roles.size() > 0) {
//            for (com.lashou.common.auth.domain.Role role : roles) {
//                sb.append(role.getName() + ",");
//            }
//        }
//        if (sb != null && sb.length() > 0) {
//            return sb.substring(0, sb.length() - 1);
//        } else {
//            // 返回默认角色
//            return "2";
//        }
//    }
//
//    /**
//     * 获取当前用户关联的角色
//     *
//     * @return
//     */
//    public String getRolesId(int i) {
//        List<com.lashou.common.auth.domain.Role> roles = securityManagement
//                .findRolesByUserId(i, null, null, null);
//
//        StringBuilder sb = new StringBuilder();
//        if (roles != null && roles.size() > 0) {
//            for (com.lashou.common.auth.domain.Role role : roles) {
//                sb.append(role.getId() + ",");
//            }
//        }
//        return sb.toString();
//
//    }
//
//    /**
//     * 获取当前用户关联的组
//     * 
//     * @return
//     * @throws BusinessException
//     */
//    public String getGroups(int i) throws BusinessException {
//        List<com.lashou.common.auth.domain.Group> groups = securityManagement
//                .findGroupByUserIds(i, null, null, null);
//        if (groups == null || groups.size() <= 0) {
//            throw BusinessExceptionEnum.NO_GROUP.getBe();
//        }
//
//        StringBuilder sb = new StringBuilder();
//        for (com.lashou.common.auth.domain.Group group : groups) {
//            sb.append(group.getName() + ",");
//        }
//        return sb.substring(0, sb.length() - 1);
//    }
//    /**
//     * 获取当前用户关联的组ID List，类型为String
//     * 
//     * @return
//     */
//    public List<String> getGroupIdsString() {
//        List<com.lashou.common.auth.domain.Group> groups = securityManagement
//                .findGroupByUserIds(getUserId(), null, null, null);
//        List<String> groupIds = new ArrayList<String>();
//        if (groups != null && groups.size() > 0) {
//            for (com.lashou.common.auth.domain.Group group : groups) {
//                if (group != null && group.getId() != null) {
//                    groupIds.add(group.getId().toString());
//                }
//            }
//        }
//        return groupIds;
//    }
//    /**
//     * 获取当前用户关联的组ID List，类型为Integer
//     * 
//     * @return
//     */
//    public List<Integer> getGroupIdList() {
//        List<com.lashou.common.auth.domain.Group> groups = securityManagement
//                .findGroupByUserIds(getUserId(), null, null, null);
//        List<Integer> groupIds = new ArrayList<Integer>();
//        if (groups != null && groups.size() > 0) {
//            for (com.lashou.common.auth.domain.Group group : groups) {
//                if (group != null && group.getId() != null) {
//                    groupIds.add(group.getId());
//                }
//            }
//        }
//        return groupIds;
//    }
//
//    /**
//     * 获取当前用户关联的组ID List，类型为Group
//     * 
//     * @return
//     */
//    public List<Group> getGroupList(int i) {
//        List<com.lashou.common.auth.domain.Group> groups = securityManagement
//                .findGroupByUserIds(i, null, null, null);
//        return groups;
//    }
//
//    /**
//     * 获取展示的页数
//     * 
//     * @param page
//     * @param pagecount
//     * @return
//     */
//    public List<Integer> getPage(Integer page, Long pagecount) {
//        List<Integer> pageC = new ArrayList<Integer>();
//        int cycle = 0;
//        if (page % 10 == 0) {
//            cycle = page / 10 - 1;
//        } else {
//            cycle = page / 10;
//        }
//        for (int i = 1; i <= pagecount; i++) {
//            if (i >= cycle * 10 + 1 && i <= cycle * 10 + 10) {
//                pageC.add(i);
//            }
//        }
//        return pageC;
//    }
//
//
//    /**
//     * @author zhangxubo 获取登录人 城市id集合
//     * @return
//     */
//    protected List<Integer> getCityList() {
//        List<Group> groupList = this.getGroupList(this.getUserId());
//        List<Integer> cityList = new ArrayList<Integer>();
//        for (Group group : groupList) {
//            Integer cityId = group.getCityId();
//            if (cityId != null) {
//                cityList.add(cityId);
//            }
//        }
//        return cityList;
//    }
//
//    
//    
//    
//    /**
//     * 检测cookies中是否拥有此cookie，没有则按照cycle指定的周期创建
//     * @param cookieName cookie名称，尽量个性化定义以避免重复
//     * @param cycle 1:当天，2:本周
//     * @param request HttpServletRequest
//     * @param response HttpServletResponse
//     * @return
//     */
//    public boolean popBoxInCookie(String cookieName, int cycle, HttpServletRequest request, HttpServletResponse response){
//        if(StringUtils.isBlank(cookieName)){
//            return false;
//        }
//        //同一电脑登录两个账号仍可正常显示
//        cookieName = cookieName +"_"+ this.getUserId();
//        //是否存在该cookie
//        boolean hasCookie = false;
//        Cookie[] cookies = request.getCookies();
//        if(cookies!=null && cookies.length > 0){
//            for(Cookie cookie:cookies){
//                if(cookie==null){
//                    continue;
//                }
//                if(cookieName.equals(cookie.getName())){
//                    hasCookie = true;
//                    String cookieValue=cookie.getValue();
//                    if("true".equals(cookieValue)){
//                        return true;
//                    }
//                    //第一次登陆后设为周期内已登陆过
//                    cookie.setValue("true");
//                    response.addCookie(cookie);
//                    break;
//                }
//            }
//        }
//        //不存在该cookie则创建新的
//        if(!hasCookie){
//            Cookie toDoCookie=new Cookie(cookieName,"true");
//            int sec=(int) getSecFromNow2Any(1);
//            toDoCookie.setMaxAge(sec);
//            toDoCookie.setPath("/");
//            response.addCookie(toDoCookie);
//        }
//        return false;
//    }
//    /**
//     * 获得当前时间到周期结束的毫秒数
//     * @param cycle 1:当天，2:本周
//     * @return
//     */
//    private long getSecFromNow2Any(int cycle) {
//        Calendar end = Calendar.getInstance();
//        //截止时间
//        switch(cycle){
//        case 1:
//            this.setEndOfTheDay(end);
//            break;
//        case 2:
//            this.setEndOfTheDay(end);
//            this.setEndOfTheWeek(end);
//            break;
//        default:
//                break;
//        }
//        //当前时间
//        Date current=new Date();
//        long second=(end.getTime().getTime()-current.getTime())/1000;
//        return second;
//    }
//    /**
//     * 日期设置为当天结束
//     * @param end
//     */
//    private void setEndOfTheDay(Calendar end){
//        end.set(Calendar.HOUR_OF_DAY, 23);  
//        end.set(Calendar.MINUTE, 59);  
//        end.set(Calendar.SECOND, 59);  
//        end.set(Calendar.MILLISECOND, 999);
//    }
//    /**
//     * 日期设置为本周最后一天
//     * @param end
//     */
//    private void setEndOfTheWeek(Calendar end){
//        //周日为一周最后一天
//        end.add(Calendar.WEEK_OF_YEAR, 1);
//        end.set(Calendar.DAY_OF_WEEK, 0);
//    }
//    
//    /**
//     * 校验当前登录人 是否有操作权限
//     *@author zhangxubo
//     *@param ownerUid 
//     * @throws BusinessException 
//     */
//    protected boolean checkUpdateAuthority(Integer ownerUid) throws BusinessException{
//    	// 如果登录人不是 超管 验证框架协议是否属于登录人 如果不是登录人 不允许修改
//    	if(!(this.checkRoleByRoleId(RoleEnum.SYSTEM_ADMIN.getId().toString()) 
//    			||  this.checkRoleByRoleId(RoleEnum.ADMIN.getId().toString())
//                ||  this.checkRoleByRoleId(RoleEnum.SUPPLIER_SERVICE_EDITOR.getId().toString()))){
//    		if(!ownerUid.equals(this.getUserId())){
//        		return false;
//        	}
//    	}
//    	return true;
//    }
//
//
//    protected String getPerfixUrl(HttpServletRequest request) {
//        RedirectUrlBuilder urlBuilder = new RedirectUrlBuilder();
//        urlBuilder.setScheme(request.getScheme());
//        urlBuilder.setServerName(request.getServerName());
//        urlBuilder.setPort(request.getServerPort());
//        return urlBuilder.getUrl();
//    }
//    
//    public SecurityManagement getSecurityManagement() {
//        return securityManagement;
//    }
//
//
//    
//    /**
//     * 每天发短信的时间：早上8:00--晚上11:00
//     * @return
//     * @throws Exception
//     */
//    public boolean canSendSms() throws Exception{
//    	Date d = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
//		Date d1 = sdf.parse( date.format(d) + " 08:00:00");
//		Date d2 = sdf.parse( date.format(d) + " 23:00:00");
//		return d.after(d1) && d.before(d2);
//    } 
//    
}
