package edu.neu.cs5200.mystereo.jsonmod;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Toptags {
	private List<Tag> tags;

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public Toptags(List<Tag> tags) {
		super();
		this.tags = tags;
	}

	public Toptags() {
		super();
	}
	


}
