package edu.neu.cs5200.mystereo.jsonmod;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import edu.neu.cs5200.mystereo.client.ArtistClient;
import edu.neu.cs5200.mystereo.models.Album;
import edu.neu.cs5200.mystereo.models.Artist;
import edu.neu.cs5200.mystereo.models.Music;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Jalbum {
	private String name;
	private String artist;
	private String mbid;
	private String url;
	private String releasedate;
	private List<Image> image;
	private Wiki wiki;

	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getArtist() {
		return artist;
	}


	public void setArtist(String artist) {
		this.artist = artist;
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


	public String getReleasedate() {
		return releasedate;
	}


	public void setReleasedate(String releasedate) {
		this.releasedate = releasedate;
	}


	public List<Image> getImage() {
		return image;
	}


	public void setImage(List<Image> image) {
		this.image = image;
	}


	public Wiki getWiki() {
		return wiki;
	}


	public void setWiki(Wiki wiki) {
		this.wiki = wiki;
	}


	public Jalbum(String name, String artist, String mbid, String url,
			String releasedate, List<Image> image, Wiki wiki) {
		super();
		this.name = name;
		this.artist = artist;
		this.mbid = mbid;
		this.url = url;
		this.releasedate = releasedate;
		this.image = image;
		this.wiki = wiki;
	}
	

	public Jalbum() {
		super();
	}


	public Album parseIntoAlbum(){
		Album album = new Album();
		album.setAlbumId(null);
		ArtistClient artc = new ArtistClient();
		Artist artist = artc
				.findArtistByName(this.getArtist().replace(" ", "%20"));
		album.setArtist(artist);
		album.setImage(this.getImage().get(2).getText());
		album.setMbid(this.getMbid());
		album.setName(this.getName());
		album.setReleaseDate(this.getReleasedate());
		album.setUrl(this.getUrl());
		if (this.getWiki()==null) album.setSummary("No Information Found!");
		else album.setSummary(this.getWiki().getSummary());
		return album;
	}
	

}
