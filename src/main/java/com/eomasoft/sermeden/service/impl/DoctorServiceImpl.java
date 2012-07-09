package com.eomasoft.sermeden.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.eomasoft.sermeden.domain.Doctor;
import com.eomasoft.sermeden.persistence.DoctorMapper;
import com.eomasoft.sermeden.service.DoctorService;

@Service
public class DoctorServiceImpl implements DoctorService{
	
	private DoctorMapper doctorMapper;
	
	@Override
	public Doctor findById(Long id) {
		return doctorMapper.findById(id);
	}

	@Override
	public List<Doctor> findByDateAndTime(String date, String time) {
		return doctorMapper.findByDateAndTime(date, time);
	}

}
