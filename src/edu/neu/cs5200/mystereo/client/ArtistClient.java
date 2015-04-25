package edu.neu.cs5200.mystereo.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.neu.cs5200.mystereo.models.Artist;
import edu.neu.cs5200.mystereo.models.Music;
import edu.neu.cs5200.mystereo.jsonmod.Image;
import edu.neu.cs5200.mystereo.jsonmod.Jartist;

public class ArtistClient {

	private final String FIND_ARTIST_BY_NAME = "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=ARTIST&api_key=14debcea4d95e934a86515e3327ee949&format=json";
	private final String FIND_ARTIST_BY_MBID = "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&mbid=MBID&api_key=14debcea4d95e934a86515e3327ee949&format=json";

	public Artist findArtistByName(String name) {
		String urlStr = FIND_ARTIST_BY_NAME.replace("ARTIST", name);
		ObjectMapper mapper = new ObjectMapper();
		String json = getJsonStringForUrl(urlStr);
		json = json.substring(10, json.length() - 1);
		Jartist artist = new Jartist();
		try {
			artist = mapper.readValue(json, Jartist.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return artist.parseIntoArtist();

	}

	public Artist findArtistByMBID(String mbid) {
		String urlStr = FIND_ARTIST_BY_MBID.replace("MBID", mbid);
		ObjectMapper mapper = new ObjectMapper();
		String json = getJsonStringForUrl(urlStr);
		json = json.substring(10, json.length() - 1);
		Jartist artist = new Jartist();
		try {
			artist = mapper.readValue(json, Jartist.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return artist.parseIntoArtist();
	}

	public String getJsonStringForUrl(String urlStr) {
		try {
			URL url = new URL(urlStr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			InputStream in = conn.getInputStream();
			InputStreamReader isr = new InputStreamReader(in);
			BufferedReader reader = new BufferedReader(isr);
			String out;
			StringBuffer json = new StringBuffer();
			while ((out = reader.readLine()) != null) {
				json.append(out);
			}
			return json.toString();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArtistClient myart = new ArtistClient();
		Artist artist = myart
				.findArtistByMBID("bfcc6d75-a6a5-4bc6-8282-47aec8531818");
		System.out.println(artist.getAlbums());

	}

}
