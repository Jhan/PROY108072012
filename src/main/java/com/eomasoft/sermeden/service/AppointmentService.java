package com.eomasoft.sermeden.service;

import java.util.List;

import com.eomasoft.sermeden.domain.Appointment;

/**
 * @author Manuel Eguiluz
 * @version 1.0
 * 
 */
public interface AppointmentService {
	
	Appointment findById(Long id);
	List<Appointment> findByPage();
	Appointment save(Appointment appointment);
	
}
