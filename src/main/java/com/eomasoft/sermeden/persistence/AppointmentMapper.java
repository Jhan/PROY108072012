package com.eomasoft.sermeden.persistence;

import java.util.List;

import com.eomasoft.sermeden.domain.Appointment;

/***
 * 
 * @author Manuel Eguiluz
 * @version 1.0
 *
 */
public interface AppointmentMapper {
	
	Appointment findById(Long id);
	List<Appointment> findByPage();
	Appointment insert(Appointment appointment);
	Appointment update(Appointment appointment);
	
}
