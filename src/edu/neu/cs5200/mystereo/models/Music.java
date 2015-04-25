package edu.neu.cs5200.mystereo.models;

import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
@Entity
public class Music {
	@Id
	private Integer msid;
	private String name;
	private String mbid;
	private String url;
	@ManyToOne
	@JoinColumn(name="artistId")
	private Artist artist;
	@ManyToOne
	@JoinColumn(name="albumId")
	private Album album;
	private String summary;
	@OneToMany(mappedBy="music")
	private List<PlayList2Music> playlistEntities;
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
	
	
	public Artist getArtist() {
		return artist;
	}
	public void setArtist(Artist artist) {
		this.artist = artist;
	}
	public Album getAlbum() {
		return album;
	}
	public void setAlbum(Album album) {
		this.album = album;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public List<PlayList2Music> getPlaylistEntities() {
		return playlistEntities;
	}
	public void setPlaylistEntities(List<PlayList2Music> playlistEntities) {
		this.playlistEntities = playlistEntities;
	}
	public void setMsid(Integer msid) {
		this.msid = msid;
	}
	
	public Integer getMsid() {
		return msid;
	}	
	
	public Music(Integer msid, String name, String mbid, String url,
			Artist artist, Album album, String summary,
			List<PlayList2Music> playlistEntities) {
		super();
		this.msid = msid;
		this.name = name;
		this.mbid = mbid;
		this.url = url;
		this.artist = artist;
		this.album = album;
		this.summary = summary;
		this.playlistEntities = playlistEntities;
	}
	public Music() {
		super();
	}
	
}
