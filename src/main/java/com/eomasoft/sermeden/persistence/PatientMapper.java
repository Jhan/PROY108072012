package com.eomasoft.sermeden.persistence;

import java.util.List;

import com.eomasoft.sermeden.domain.Patient;

/**
 * @author Manuel Eguiluz
 * @version 1.0
 * 
 */
public interface PatientMapper {

	void insert(Patient patient);
	void update(Patient patient);
	List<Patient> findByDni(String dni);
	List<Patient> findByFullName(String fullName);
	List<Patient> findByIdMedico(int idmedico);
	
}
