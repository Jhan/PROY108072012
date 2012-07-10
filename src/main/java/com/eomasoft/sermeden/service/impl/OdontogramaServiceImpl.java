package com.eomasoft.sermeden.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.eomasoft.sermeden.domain.Diente;
import com.eomasoft.sermeden.persistence.OdontogramaMapper;
import com.eomasoft.sermeden.persistence.PatientMapper;
import com.eomasoft.sermeden.service.OdontogramaService;

@Service
public class OdontogramaServiceImpl implements OdontogramaService {

	private OdontogramaMapper odontogramaMapper;
	
	@Override
	public List<Diente> findByDniPaciente(String dniPaciente) {

		return odontogramaMapper.findByDniPaciente(dniPaciente);
	}
	@Inject
	public void setOdontogramaMapper(OdontogramaMapper odontogramaMapper) {
		this.odontogramaMapper = odontogramaMapper;
	}
}
