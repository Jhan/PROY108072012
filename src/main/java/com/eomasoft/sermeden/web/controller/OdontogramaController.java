package com.eomasoft.sermeden.web.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eomasoft.sermeden.domain.Diente;
import com.eomasoft.sermeden.domain.Patient;
import com.eomasoft.sermeden.service.OdontogramaService;
import com.eomasoft.sermeden.service.PatientService;
import com.eomasoft.sermeden.web.dto.JQResponse;

@Controller
@RequestMapping("/odontograma")
public class OdontogramaController {

	private OdontogramaService odontogramaService;
	
	@RequestMapping(value = "/find", params = "dniPaciente", method = RequestMethod.GET)
	public @ResponseBody
	JQResponse<Diente> findByDniPaciente(@RequestParam(value = "dniPaciente") String dniPaciente) {

		List<Diente> dienteList = odontogramaService.findByDniPaciente(dniPaciente);
		
		JQResponse<Diente> response = new JQResponse<Diente>();
		response.setRows(dienteList);
		response.setTotal(String.valueOf(dienteList.size()));
		return response;
	}
	@Inject
	public void setOdontogramaService(OdontogramaService odontogramaService) {
		this.odontogramaService = odontogramaService;
	}
}
