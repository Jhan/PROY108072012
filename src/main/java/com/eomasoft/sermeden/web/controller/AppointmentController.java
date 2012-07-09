package com.eomasoft.sermeden.web.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eomasoft.sermeden.domain.Appointment;
import com.eomasoft.sermeden.service.AppointmentService;
import com.eomasoft.sermeden.web.dto.DialogResponse;

@Controller
@RequestMapping("/appointment")
public class AppointmentController {
	
	private AppointmentService appointmentService;
	
	@RequestMapping(params="form", method=RequestMethod.GET)
	public String createForm(Model model){
		return "/appointment?form";
	}
	
	@RequestMapping(params="form", method=RequestMethod.POST)
	public @ResponseBody DialogResponse create(@RequestBody Appointment appointment){
		//TODO: Server validation
		appointmentService.save(appointment);
		return new DialogResponse();
	}
	
	@Inject
	public void setAppointmentService(AppointmentService appointmentService) {
		this.appointmentService = appointmentService;
	}
	
}
