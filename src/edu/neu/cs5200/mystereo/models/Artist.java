package edu.neu.cs5200.mystereo.models;

import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@JsonIgnoreProperties(ignoreUnknown=true)
public class Artist {
	@Id
	private Integer artistId;
	private String name;
	private String mbid;
	private String url;
	private String image;
	private String summary;
	@OneToMany(mappedBy="artist")
	private List<Album> albums;
	@OneToMany(mappedBy="artist")
	private List<Music> music;
	public Integer getArtistId() {
		return artistId;
	}
	public void setArtistId(Integer artistId) {
		this.artistId = artistId;
	}
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public List<Album> getAlbums() {
		return albums;
	}
	public void setAlbums(List<Album> albums) {
		this.albums = albums;
	}
	public List<Music> getMusic() {
		return music;
	}
	public void setMusic(List<Music> music) {
		this.music = music;
	}
	public Artist(Integer artistId, String name, String mbid, String url,
			String image, String summary, List<Album> albums, List<Music> music) {
		super();
		this.artistId = artistId;
		this.name = name;
		this.mbid = mbid;
		this.url = url;
		this.image = image;
		this.summary = summary;
		this.albums = albums;
		this.music = music;
	}
	public Artist() {
		super();
	}
	
	
}
