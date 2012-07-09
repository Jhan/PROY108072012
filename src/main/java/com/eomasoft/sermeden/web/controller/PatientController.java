package com.eomasoft.sermeden.web.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eomasoft.sermeden.domain.Patient;
import com.eomasoft.sermeden.service.PatientService;
import com.eomasoft.sermeden.web.dto.DialogResponse;
import com.eomasoft.sermeden.web.dto.JQResponse;

@Controller
@RequestMapping("/patient")
public class PatientController {

	private PatientService patientService;

	@RequestMapping(params = "form", method = RequestMethod.GET)
	public String createForm() {
		return "/patient?form";
	}

	@RequestMapping(method = RequestMethod.POST, headers="Accept=application/json")
	public @ResponseBody
	DialogResponse create(@RequestBody Patient patient) {
		// TODO: Server validation
		patientService.save(patient);
		return new DialogResponse();
	}

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody
	DialogResponse create2(@RequestBody Patient patient) {
		// TODO: Server validation
		patientService.save(patient);
		return new DialogResponse();
	}

	@RequestMapping(value = "/find", params = "dni", method = RequestMethod.GET)
	public @ResponseBody
	JQResponse<Patient> findByDni(@RequestParam(value = "dni") String dni) {

		List<Patient> patientList = patientService.findByDni(dni);

		JQResponse<Patient> response = new JQResponse<Patient>();
		response.setRows(patientList);
		response.setTotal(String.valueOf(patientList.size()));

		return response;
	}

	@RequestMapping(value = "/find", params = "fullname", method = RequestMethod.GET)
	public @ResponseBody
	JQResponse<Patient> findByFullName(
			@RequestParam(value = "fullName") String fullName) {

		List<Patient> patientList = patientService.findByFullName(fullName);

		JQResponse<Patient> response = new JQResponse<Patient>();
		response.setRows(patientList);
		response.setTotal(String.valueOf(patientList.size()));

		return response;
	}

	/*JHAN*/
	@RequestMapping(value = "/find", params = "idmedico", method = RequestMethod.GET)
	public @ResponseBody
	JQResponse<Patient> findByIdMedico(
			@RequestParam(value = "idmedico") int idmedico) {

		List<Patient> patientList = patientService.findByIdMedico(idmedico);

		JQResponse<Patient> response = new JQResponse<Patient>();
		response.setRows(patientList);
		response.setTotal(String.valueOf(patientList.size()));

		return response;
	}	
	@Inject
	public void setPatientService(PatientService patientService) {
		this.patientService = patientService;
	}
}
