package edu.neu.cs5200.mystereo.jsonmod;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import edu.neu.cs5200.mystereo.models.Album;
import edu.neu.cs5200.mystereo.models.Artist;
import edu.neu.cs5200.mystereo.models.Music;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Jartist {
	private String name;
	private String mbid;
	private String url;
	private List<Image> image;
	private Bio bio;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMbid() {
		return mbid;
	}

	public void setMbid(String mbid) {
		this.mbid = mbid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<Image> getImage() {
		return image;
	}

	public void setImage(List<Image> image) {
		this.image = image;
	}

	public Bio getBio() {
		return bio;
	}

	public void setBio(Bio bio) {
		this.bio = bio;
	}

	public Jartist(String name, String mbid, String url, List<Image> image,
			Bio bio) {
		super();
		this.name = name;
		this.mbid = mbid;
		this.url = url;
		this.image = image;
		this.bio = bio;
	}

	public Jartist() {
		super();
	}

	public Artist parseIntoArtist() {
		Artist artist = new Artist();
		artist.setImage(this.getImage().get(3).getText());
		artist.setMbid(this.getMbid());
		artist.setName(this.getName());
		if (this.getBio()==null) artist.setSummary("No information found!");
		else artist.setSummary(this.getBio().getSummary());
		artist.setUrl(this.getUrl());
		return artist;
	}

}
