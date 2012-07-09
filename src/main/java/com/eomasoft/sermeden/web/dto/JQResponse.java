package com.eomasoft.sermeden.web.dto;


public class JQResponse<T> extends AbstractResponse<T> {

	/**
	* Current page of the query
	*/
	private String page;
	 
	/**
	* Total pages for the query
	*/
	private String total;
	 
	/**
	* Total number of records for the query
	*/
	private String records;
	
	public JQResponse() {
		this.page = "1";
		this.total = "1";
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getRecords() {
		return records;
	}

	public void setRecords(String records) {
		this.records = records;
	}

}
