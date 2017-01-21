package com.shear.front.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ConfigController {

    @RequestMapping("/MP_verify_IQbZCraCt328SjeF.txt")
    @ResponseBody
    public String index(Model model,HttpSession session) {
	return "IQbZCraCt328SjeF";
    }
    
}
