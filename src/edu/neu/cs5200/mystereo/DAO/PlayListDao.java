package edu.neu.cs5200.mystereo.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.mystereo.models.PlayList;

public class PlayListDao {
	EntityManagerFactory factory = Persistence
			.createEntityManagerFactory("MyStereo");
	EntityManager em = null;

	// CRUD
	// CREATE
	public List<PlayList> createPlayList(PlayList playlist) {
		List<PlayList> playlists = new ArrayList<PlayList>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(playlist);
		Query query = em.createQuery("select playlist from PlayList playlist");
		playlists = (List<PlayList>) query.getResultList();

		em.getTransaction().commit();
		em.close();
		return playlists;
	}

	// READ

	public PlayList findPlayList(int playlistId) {
		em = factory.createEntityManager();
		PlayList playlist = null;

		playlist = em.find(PlayList.class, playlistId);
		em.close();
		return playlist;

	}

	// READALL

	public List<PlayList> findAllPlayLists(Integer userId) {
		em = factory.createEntityManager();
		Query query = em.createQuery("select playlist from PlayList playlist");
		List<PlayList> playlists = new ArrayList<PlayList>();
		List<PlayList> lists = (List<PlayList>) query.getResultList();

		for (PlayList list : lists) {
			if (list.getUser().getuId() == userId) {
				playlists.add(list);
			}
		}

		em.close();
		return playlists;
	}

	// UPDATE
	public List<PlayList> updatePlayList(int playlistId, PlayList playlist) {
		List<PlayList> playlists = new ArrayList<PlayList>();
		em = factory.createEntityManager();
		em.getTransaction().begin();

		playlist.setpId(playlistId);
		em.merge(playlist);
		Query query = em
				.createQuery("select playlist from PlayList playlist");
		playlists = (List<PlayList>) query.getResultList();

		em.getTransaction().commit();
		em.close();
		return playlists;
	}

	// DELETE

	public List<PlayList> removePlayList(int playlistId) {
		List<PlayList> playlists = new ArrayList<PlayList>();
		PlayList playlist = null;
		em = factory.createEntityManager();
		em.getTransaction().begin();

		playlist = em.find(PlayList.class, playlistId);
		em.remove(playlist);

		Query query = em
				.createQuery("select playlist from PlayList playlist");
		playlists = (List<PlayList>) query.getResultList();

		em.getTransaction().commit();
		em.close();

		return playlists;
	}

}