package edu.neu.cs5200.mystereo.jsonmod;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Toptags {
	private List<Tag> tag;

	public List<Tag> getTag() {
		return tag;
	}

	public void setTag(List<Tag> tag) {
		this.tag = tag;
	}

	public Toptags(List<Tag> tag) {
		super();
		this.tag = tag;
	}

	public Toptags() {
		super();
	}
	


}
