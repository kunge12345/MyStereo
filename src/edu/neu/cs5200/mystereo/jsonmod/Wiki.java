package edu.neu.cs5200.mystereo.jsonmod;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Wiki {
	private String summary;

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Wiki(String summary) {
		super();
		this.summary = summary;
	}

	public Wiki() {
		super();
	}
	

}
