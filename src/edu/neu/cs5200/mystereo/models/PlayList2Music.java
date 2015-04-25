package edu.neu.cs5200.mystereo.models;

import javax.persistence.*;

@Entity
public class PlayList2Music {
	@Id
	private Integer id;
	@ManyToOne
	@JoinColumn(name="playlistId")
	private PlayList playlist;
	@ManyToOne
	@JoinColumn(name="musicId")
	private Music music;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public PlayList getPlaylist() {
		return playlist;
	}
	public void setPlaylist(PlayList playlist) {
		this.playlist = playlist;
	}
	public Music getMusic() {
		return music;
	}
	public void setMusic(Music music) {
		this.music = music;
	}
	public PlayList2Music(Integer id, PlayList playlist, Music music) {
		super();
		this.id = id;
		this.playlist = playlist;
		this.music = music;
	}
	public PlayList2Music() {
		super();
	}
	
	

}
