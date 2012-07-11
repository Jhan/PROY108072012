package com.eomasoft.sermeden.persistence;

import java.util.List;

import com.eomasoft.sermeden.domain.Diente;
import com.eomasoft.sermeden.domain.Patient;

/**
 * @author Manuel Eguiluz
 * @version 1.0
 * 
 */
public interface OdontogramaMapper {

	List<Diente> findByDniPaciente(String dniPaciente);

	void insert(Diente diente);
	void update(Diente diente);
	
}
