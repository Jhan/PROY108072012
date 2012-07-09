package com.eomasoft.sermeden.web.dto;

import java.util.List;

public interface Response<T> {
	
	/**
	* An array that contains the actual objects
	*/
	List<T> getRows();
	
}
