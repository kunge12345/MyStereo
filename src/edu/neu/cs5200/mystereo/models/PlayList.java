package edu.neu.cs5200.mystereo.models;

import java.util.List;

import javax.persistence.*;

@Entity
public class PlayList {
	@Id
	private Integer pId;
	private String title;
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;
	@OneToMany(mappedBy="playlist")
	private List<PlayList2Music> playListEntries;
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<PlayList2Music> getPlayListEntries() {
		return playListEntries;
	}
	public void setPlayListEntries(List<PlayList2Music> playListEntries) {
		this.playListEntries = playListEntries;
	}
	public PlayList(Integer pId, String title, User user,
			List<PlayList2Music> playListEntries) {
		super();
		this.pId = pId;
		this.title = title;
		this.user = user;
		this.playListEntries = playListEntries;
	}
	public PlayList() {
		super();
	}
	

}
