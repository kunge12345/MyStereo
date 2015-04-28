package edu.neu.cs5200.mystereo.jsonmod;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import edu.neu.cs5200.mystereo.client.AlbumClient;
import edu.neu.cs5200.mystereo.client.ArtistClient;
import edu.neu.cs5200.mystereo.models.Album;
import edu.neu.cs5200.mystereo.models.Artist;
import edu.neu.cs5200.mystereo.models.Music;
import edu.neu.cs5200.mystereo.models.PlayList2Music;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Jmusic {
	private String name;
	private String mbid;
	private String url;
	private Jartist artist;
	private Jalbum album;
	private Toptags toptags;
	private List<PlayList2Music> playlistEntities;
	private Wiki wiki;

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

	public Toptags getToptags() {
		return toptags;
	}

	public void setToptags(Toptags toptags) {
		this.toptags = toptags;
	}

	public Wiki getWiki() {
		return wiki;
	}

	public void setWiki(Wiki wiki) {
		this.wiki = wiki;
	}

	public List<PlayList2Music> getPlaylistEntities() {
		return playlistEntities;
	}

	public void setPlaylistEntities(List<PlayList2Music> playlistEntities) {
		this.playlistEntities = playlistEntities;
	}
	
	

	public Jartist getArtist() {
		return artist;
	}

	public void setArtist(Jartist artist) {
		this.artist = artist;
	}

	public Jalbum getAlbum() {
		return album;
	}

	public void setAlbum(Jalbum album) {
		this.album = album;
	}


	public Jmusic(String name, String mbid, String url, Jartist artist,
			Jalbum album, Toptags toptags,
			List<PlayList2Music> playlistEntities, Wiki wiki) {
		super();
		this.name = name;
		this.mbid = mbid;
		this.url = url;
		this.artist = artist;
		this.album = album;
		this.toptags = toptags;
		this.playlistEntities = playlistEntities;
		this.wiki = wiki;
	}

	public Jmusic() {
		super();
	}

	public Music parseIntoMusic() {
		Music music = new Music();
		Album album = new Album();
		Artist artist = new Artist();
		AlbumClient albc = new AlbumClient();
		ArtistClient artc = new ArtistClient();
		album = albc.findAlbumByMBID(this.getAlbum().getMbid());
		artist = artc.findArtistByMBID(this.getArtist().getMbid());
		music.setAlbum(album);
		music.setMbid(this.getMbid());
		music.setName(this.getName());
		music.setTag(this.getToptags().getTag().get(0).getName());
		music.setUrl(this.getUrl());
		if (this.getWiki()==null) music.setSummary("No information found");
		else music.setSummary(this.getWiki().getSummary());
		return music;
	}

}
