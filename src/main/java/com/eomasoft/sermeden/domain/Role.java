package com.eomasoft.sermeden.domain;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Role implements Serializable {

	private Long id;
	private String description;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", description=" + description + "]";
	}
}
