package edu.neu.cs5200.mystereo.models;

import javax.persistence.*;

@Entity
public class Follow {
	@Id
	private Integer fid;
	@ManyToOne
	@JoinColumn(name="follow")
	private User follow;
	@ManyToOne
	@JoinColumn(name="followed")
	private   User followed;
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	public User getFollow() {
		return follow;
	}
	public void setFollow(User follow) {
		this.follow = follow;
	}
	public User getFollowed() {
		return followed;
	}
	public void setFollowed(User followed) {
		this.followed = followed;
	}
	public Follow(Integer fid, User follow, User followed) {
		super();
		this.fid = fid;
		this.follow = follow;
		this.followed = followed;
	}
	public Follow() {
		super();
	}
	


}
