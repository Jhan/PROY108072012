package com.eomasoft.sermeden.web.dto;

import java.util.List;


public abstract class AbstractResponse<T> implements Response<T>{
	
	private List<T> rows;
	
	@Override
	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

}
