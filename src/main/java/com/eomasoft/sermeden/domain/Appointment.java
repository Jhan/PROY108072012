package com.eomasoft.sermeden.domain;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Appointment implements Serializable {

	private Long id;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
