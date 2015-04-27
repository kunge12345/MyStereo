package edu.neu.cs5200.mystereo.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {
	@Id
	private Integer uId;
	private String username;
	private String password;
	private String sex;
	private String description;
	@OneToMany(mappedBy = "user")
	private List<PlayList> playlists;
	@OneToMany(mappedBy = "follow")
	private List<Follow> follows;
	@OneToMany(mappedBy = "followed")
	private List<Follow> followeds;
	@OneToMany(mappedBy="user")
	private List<Comment> comments;
	private String type;

	public Integer getuId() {
		return uId;
	}

	public void setuId(Integer uId) {
		this.uId = uId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<PlayList> getPlaylists() {
		return playlists;
	}

	public void setPlaylists(List<PlayList> playlists) {
		this.playlists = playlists;
	}
	
	

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	

	public List<Follow> getFollows() {
		return follows;
	}

	public void setFollows(List<Follow> follows) {
		this.follows = follows;
	}

	public List<Follow> getFolloweds() {
		return followeds;
	}

	public void setFolloweds(List<Follow> followeds) {
		this.followeds = followeds;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	
	public User(Integer uId, String username, String password, String sex,
			String description, List<PlayList> playlists, List<Follow> follows,
			List<Follow> followeds, List<Comment> comments, String type) {
		super();
		this.uId = uId;
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.description = description;
		this.playlists = playlists;
		this.follows = follows;
		this.followeds = followeds;
		this.comments = comments;
		this.type = type;
	}

	public User() {
		super();
	}

}