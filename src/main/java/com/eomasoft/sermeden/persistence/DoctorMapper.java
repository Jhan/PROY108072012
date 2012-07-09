package com.eomasoft.sermeden.persistence;

import java.util.List;

import com.eomasoft.sermeden.domain.Doctor;

/**
 * @author Manuel Eguiluz
 * @version 1.0
 * 
 */
public interface DoctorMapper {
	
	Doctor findById(Long id);
	List<Doctor> findByDateAndTime(String date, String time);
	
}
