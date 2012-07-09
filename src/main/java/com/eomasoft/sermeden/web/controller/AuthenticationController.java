package com.eomasoft.sermeden.web.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthenticationController {
	
	@RequestMapping("/login")
	public String login(@RequestParam(value = "login_attempt", required = false) String loginAttempt, Model model) {
		
		if (loginAttempt != null) {
			model.addAttribute("error", "Usuario o contrasena incorrectos.");
		}
		
		return "login";
	}
	
	@RequestMapping(value = "/denied", method = GET)
	public String denied() {
		return "denied";
	}


}
