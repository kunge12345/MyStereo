package edu.neu.cs5200.mystereo.jsonmod;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Bio {
	private String summary;
	private String yearformed;
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getYearformed() {
		return yearformed;
	}
	public void setYearformed(String yearformed) {
		this.yearformed = yearformed;
	}
	public Bio(String summary, String yearformed) {
		super();
		this.summary = summary;
		this.yearformed = yearformed;
	}
	public Bio() {
		super();
	}
	

}
