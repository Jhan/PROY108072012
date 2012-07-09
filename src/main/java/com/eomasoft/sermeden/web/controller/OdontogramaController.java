package com.eomasoft.sermeden.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OdontogramaController {

	@RequestMapping({"/odontograma" })
	public String odontograma() {
		return "odontograma";
	}

}
