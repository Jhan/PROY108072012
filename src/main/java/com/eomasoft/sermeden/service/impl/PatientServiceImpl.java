package com.eomasoft.sermeden.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.eomasoft.sermeden.domain.Patient;
import com.eomasoft.sermeden.persistence.PatientMapper;
import com.eomasoft.sermeden.service.PatientService;

@Service
public class PatientServiceImpl implements PatientService {

	private PatientMapper patientMapper;
	
	@Override
	public Patient save(Patient patient) {
		if(patient.getId() == null){
			patientMapper.insert(patient);
		}else{
			patientMapper.update(patient);
		}
		return patient;
	}

	@Override
	public List<Patient> findByDni(String dni) {
		return patientMapper.findByDni(dni);
	}

	@Override
	public List<Patient> findByFullName(String fullName) {
		return patientMapper.findByFullName(fullName);
	}
	
	@Inject
	public void setPatientMapper(PatientMapper patientMapper) {
		this.patientMapper = patientMapper;
	}

	@Override
	public List<Patient> findByIdMedico(int idmedico) {
		// TODO Auto-generated method stub
		return patientMapper.findByIdMedico(idmedico);
	}

}
