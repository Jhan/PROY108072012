package com.eomasoft.sermeden.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.eomasoft.sermeden.domain.Appointment;
import com.eomasoft.sermeden.persistence.AppointmentMapper;
import com.eomasoft.sermeden.service.AppointmentService;

@Service
public class AppointmentServiceImpl implements AppointmentService {

	private AppointmentMapper appointmentMapper;

	@Override
	public Appointment findById(Long id) {
		return appointmentMapper.findById(id);
	}

	@Override
	public List<Appointment> findByPage() {
		return appointmentMapper.findByPage();
	}

	@Override
	public Appointment save(Appointment appointment) {
		if (appointment.getId() == null) {
			appointmentMapper.insert(appointment);
		} else {
			appointmentMapper.update(appointment);
		}
		return appointment;
	}
	
	@Inject
	public void setAppointmentMapper(AppointmentMapper appointmentMapper) {
		this.appointmentMapper = appointmentMapper;
	}

}
