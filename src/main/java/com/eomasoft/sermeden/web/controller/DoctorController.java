package com.eomasoft.sermeden.web.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eomasoft.sermeden.domain.Doctor;
import com.eomasoft.sermeden.service.DoctorService;
import com.eomasoft.sermeden.web.dto.JQResponse;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	
	private DoctorService doctorService;
	
	@RequestMapping(value="{id}")
	public @ResponseBody Doctor findById(@PathVariable("id") Long id){
		//TODO: Server validation
		return doctorService.findById(id);
	}

	@RequestMapping(value = "/{date}/{time}", method = RequestMethod.GET)
	public @ResponseBody JQResponse<Doctor> findAvailability(
			@PathVariable("date") String date,
			@PathVariable("time") String time) {
		
		//TODO: Server validation
		List<Doctor> doctorList = doctorService.findByDateAndTime(date, time);
		
		JQResponse<Doctor> response = new JQResponse<Doctor>();
		response.setRows(doctorList);
		response.setRecords(String.valueOf(doctorList.size()));
		
		return response;
	}

}
