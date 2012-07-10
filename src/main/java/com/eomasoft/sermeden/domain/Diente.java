package com.eomasoft.sermeden.domain;

import java.util.List;

public class Diente {

	private Long id;
	private Long idEstom;
	private int nro;		// pieza 1
	private int tipo;		// 4:molar 3:premolar 2:canino 1:incisivo  
	private int estado;		// 4:curado 3:enproceso 2:porcurar 1:nocurar
	private int c_inc;
	private int c_est;
	private int s1_inc;		// id de la incidencia 
	private int s1_est;		// 4:curado 3:enproceso 2:porcurar 1:nocurar
	private int s2_inc;
	private int s2_est;
	private int s3_inc;
	private int s3_est;
	private int s4_inc;
	private int s4_est;
	private int s5_inc;
	private int s5_est;
	private int ld_inc;
	private int ld_est;
	private int li_inc;
	private int li_est;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getIdEstom() {
		return idEstom;
	}
	public void setIdEstom(Long idEstom) {
		this.idEstom = idEstom;
	}
	public int getNro() {
		return nro;
	}
	public void setNro(int nro) {
		this.nro = nro;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	
	public int getC_inc() {
		return c_inc;
	}
	public void setC_inc(int c_inc) {
		this.c_inc = c_inc;
	}
	public int getC_est() {
		return c_est;
	}
	public void setC_est(int c_est) {
		this.c_est = c_est;
	}
	public int getS1_inc() {
		return s1_inc;
	}
	public void setS1_inc(int s1_inc) {
		this.s1_inc = s1_inc;
	}
	public int getS1_est() {
		return s1_est;
	}
	public void setS1_est(int s1_est) {
		this.s1_est = s1_est;
	}
	public int getS2_inc() {
		return s2_inc;
	}
	public void setS2_inc(int s2_inc) {
		this.s2_inc = s2_inc;
	}
	public int getS2_est() {
		return s2_est;
	}
	public void setS2_est(int s2_est) {
		this.s2_est = s2_est;
	}
	public int getS3_inc() {
		return s3_inc;
	}
	public void setS3_inc(int s3_inc) {
		this.s3_inc = s3_inc;
	}
	public int getS3_est() {
		return s3_est;
	}
	public void setS3_est(int s3_est) {
		this.s3_est = s3_est;
	}
	public int getS4_inc() {
		return s4_inc;
	}
	public void setS4_inc(int s4_inc) {
		this.s4_inc = s4_inc;
	}
	public int getS4_est() {
		return s4_est;
	}
	public void setS4_est(int s4_est) {
		this.s4_est = s4_est;
	}
	public int getS5_inc() {
		return s5_inc;
	}
	public void setS5_inc(int s5_inc) {
		this.s5_inc = s5_inc;
	}
	public int getS5_est() {
		return s5_est;
	}
	public void setS5_est(int s5_est) {
		this.s5_est = s5_est;
	}
	public int getLd_inc() {
		return ld_inc;
	}
	public void setLd_inc(int ld_inc) {
		this.ld_inc = ld_inc;
	}
	public int getLd_est() {
		return ld_est;
	}
	public void setLd_est(int ld_est) {
		this.ld_est = ld_est;
	}
	public int getLi_inc() {
		return li_inc;
	}
	public void setLi_inc(int li_inc) {
		this.li_inc = li_inc;
	}
	public int getLi_est() {
		return li_est;
	}
	public void setLi_est(int li_est) {
		this.li_est = li_est;
	}

}
