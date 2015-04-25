package edu.neu.cs5200.mystereo.models;


import java.util.List;

import javax.persistence.*;

@Entity
public class Album {
	@Id
	private Integer albumId;
	private String name;
	private String mbid;
	private String url;
	private String releaseDate;
	private String image;
	private String summary;
	@ManyToOne
	@JoinColumn(name="artistId")
	private Artist artist;
	@OneToMany(mappedBy="album")
	private List<Music> music;
	public Integer getAlbumId() {
		return albumId;
	}
	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
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
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
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
	public Artist getArtist() {
		return artist;
	}
	public void setArtist(Artist artist) {
		this.artist = artist;
	}
	public List<Music> getMusic() {
		return music;
	}
	public void setMusic(List<Music> music) {
		this.music = music;
	}
	public Album(Integer albumId, String name, String mbid, String url,
			String releaseDate, String image, String summary, Artist artist,
			List<Music> music) {
		super();
		this.albumId = albumId;
		this.name = name;
		this.mbid = mbid;
		this.url = url;
		this.releaseDate = releaseDate;
		this.image = image;
		this.summary = summary;
		this.artist = artist;
		this.music = music;
	}
	public Album() {
		super();
	}
	
	

}
