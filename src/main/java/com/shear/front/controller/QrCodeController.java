package com.shear.front.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.shear.front.utils.MatrixToImageWriter;

@Controller
@RequestMapping("/open")
public class QrCodeController {

    private static final Logger LOGGER = LoggerFactory.getLogger(QrCodeController.class);

    @RequestMapping("/getcode")
    public void getCode(Model model, HttpServletResponse response, String data_url) {
	String text = data_url;
	int width = 300;
	int height = 300;
	// 二维码的图片格式
	String format = "png";
	HashMap<EncodeHintType, String> hints = new HashMap<EncodeHintType, String>();
	// 内容所使用编码
	hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
	try {
	    BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height, hints);
	    // 生成二维码
	    MatrixToImageWriter.writeToStream(bitMatrix, format, response.getOutputStream());
	} catch (Exception e) {
	    LOGGER.error("生成二维码异常", e);
	}
    }
}
