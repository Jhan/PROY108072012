package com.eomasoft.sermeden.web.dto;

import com.google.common.collect.Lists;

public class DialogResponse extends AbstractResponse<String> {

	public static final String DEFAULT_TITLE = "Operaci&oacute;n exitosa";
	public static final String DEFAULT_ROW = "La operación se ha realizado con &eacute;xito";

	private boolean success;
	private String title;

	public DialogResponse() {
		this.success = Boolean.TRUE;
		this.title = DEFAULT_TITLE;
		this.setRows(Lists.newArrayList(DEFAULT_ROW));
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
