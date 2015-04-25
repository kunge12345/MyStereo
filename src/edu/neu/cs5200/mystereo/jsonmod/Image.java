package edu.neu.cs5200.mystereo.jsonmod;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Image {
	@JsonProperty("#text")
	private String text;
	private String size;
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Image(String text, String size) {
		super();
		this.text = text;
		this.size = size;
	}
	public Image() {
		super();
	}
	

}
