package edu.neu.cs5200.mystereo.jsonmod;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Tag {
	private String name;
	private String url;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Tag(String name, String url) {
		super();
		this.name = name;
		this.url = url;
	}
	public Tag() {
		super();
	}
	

}
