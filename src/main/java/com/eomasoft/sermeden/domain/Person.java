package com.eomasoft.sermeden.domain;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Person implements Serializable {

	private Long id;
	private String dni;
	private String name;
	private String lastname;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	@Override
	public String toString() {
		return "Person [id=" + id + ", dni=" + dni + ", name=" + name
				+ ", lastname=" + lastname + "]";
	}

}
