package com.eomasoft.sermeden.service;

import java.util.List;

import com.eomasoft.sermeden.domain.Doctor;

/**
 * @author Manuel Eguiluz
 * @version 1.0
 * 
 */
public interface DoctorService {
	
	Doctor findById(Long id);
	List<Doctor> findByDateAndTime(String date, String time);

}
