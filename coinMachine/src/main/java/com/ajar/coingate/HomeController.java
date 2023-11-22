package com.ajar.coingate;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"", "/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Locale locale, Model model) {
		// Your controller logic for regular requests
		return "index";
	}
	
	/**
	 * Handles JSONP requests and returns JSONP response.
	 */
	@RequestMapping(value = {"", "/"}, method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
	@ResponseBody
	public String handleJsonp(@RequestParam(value = "test", required = false) String callback, Locale locale, Model model) {
		// Your controller logic for JSONP requests
		
		// You can include logic here to generate the response data
		String responseData = "your_response_data"; // Replace with your actual response data
		
		// Wrap the response with the callback for JSONP requests
		if (callback != null && !callback.isEmpty()) {
			System.out.println("callback" + callback);
			return callback + "(" + responseData + ")";
		} else {
			System.out.println("callbackF" + callback);
			return responseData;
		}
	}
	
}
