package com.eomasoft.sermeden.service;

import java.util.List;

import com.eomasoft.sermeden.domain.Diente;
import com.eomasoft.sermeden.domain.Patient;

/**
 * @author Manuel Eguiluz
 * @version 1.0
 * 
 */
public interface OdontogramaService {
	
	List<Diente> findByDniPaciente(String dniPaciente);
}
