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
	private String tag;
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}

	@ManyToOne
	@JoinColumn(name="albumId")
	private Album album;
	private String summary;
	@OneToMany(mappedBy="music")
	private List<PlayList2Music> playlistEntities;
	@OneToMany(mappedBy="music")
	private List<Comment> comments;
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
	
	
	
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}	
	
	 
	
	public Music(Integer msid, String name, String mbid, String url,
			String tag, Album album, String summary,
			List<PlayList2Music> playlistEntities, List<Comment> comments) {
		super();
		this.msid = msid;
		this.name = name;
		this.mbid = mbid;
		this.url = url;
		this.tag = tag;
		this.album = album;
		this.summary = summary;
		this.playlistEntities = playlistEntities;
		this.comments = comments;
	}
	public Music() {
		super();
	}
	
}
