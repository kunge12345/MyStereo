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

import edu.neu.cs5200.mystereo.jsonmod.Jalbum;
import edu.neu.cs5200.mystereo.jsonmod.Jartist;
import edu.neu.cs5200.mystereo.models.Album;
import edu.neu.cs5200.mystereo.models.Artist;

public class AlbumClient {
	private final String FIND_ALBUM_BY_NAME_AND_ARTIST = "http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=14debcea4d95e934a86515e3327ee949&artist=ARTIST&album=NAME&format=json";
	private final String FIND_ALBUM_BY_MBID = "http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=14debcea4d95e934a86515e3327ee949&mbid=MBID&format=json";

	public Album findAlbumByNameAndArtist(String name, String artist) {
		String urlStr = FIND_ALBUM_BY_NAME_AND_ARTIST.replace("ARTIST", artist).replace("NAME", name);
		ObjectMapper mapper = new ObjectMapper();
		String json = getJsonStringForUrl(urlStr);
		json = json.substring(9, json.length() - 1);
		Jalbum  jalbum = new Jalbum();
		try {
			jalbum = mapper.readValue(json, Jalbum.class);
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
		return jalbum.parseIntoAlbum();

	}

	public Album findAlbumByMBID(String mbid) {
		String urlStr = FIND_ALBUM_BY_MBID.replace("MBID", mbid);
		ObjectMapper mapper = new ObjectMapper();
		String json = getJsonStringForUrl(urlStr);
		json = json.substring(9, json.length() - 1);
		Jalbum jalbum = new Jalbum();
		try {
			jalbum = mapper.readValue(json, Jalbum.class);
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
		return jalbum.parseIntoAlbum();

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
		AlbumClient albc = new AlbumClient();
		Album album = albc
				.findAlbumByNameAndArtist("Believe", "Cher");
		System.out.println(album.getArtist().getImage());

	}


}
