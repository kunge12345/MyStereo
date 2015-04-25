package edu.neu.cs5200.mystereo.models;

import java.util.List;

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

	

	public User(Integer uId, String username, String password, String sex,
			String description, List<PlayList> playlists, String type) {
		super();
		this.uId = uId;
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.description = description;
		this.playlists = playlists;
		this.type = type;
	}

	public User() {
		super();
	}

}