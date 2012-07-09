package com.eomasoft.sermeden.domain;

public class Incidencia {

	private int idIncidencia;
	private int tipo;			//1:Hallazgo 2:Tratamiento 3:Implantes
	private int intervencion;	//0:NO  1:SI
	private int estadoCuracion;	//1:PorTratar  2:Tratando   3:Curado
	private int nivelUso;		//0:Pieza  1:PiezaIzqDer 2:PiezaSector

}
