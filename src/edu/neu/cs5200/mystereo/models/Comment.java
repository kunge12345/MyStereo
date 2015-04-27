package edu.neu.cs5200.mystereo.models;

import javax.persistence.*;

@Entity
public class Comment {
	@Id
	private Integer id;
	private String title;
	private String content;
	@ManyToOne
	@JoinColumn(name = "uId")
	private User user;
	@ManyToOne
	@JoinColumn(name = "msId")
	private Music music;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Music getMusic() {
		return music;
	}

	public void setMusic(Music music) {
		this.music = music;
	}

	public Comment(Integer id, String title, String content, User user,
			Music music) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.user = user;
		this.music = music;
	}

	public Comment() {
		super();
	}

}
