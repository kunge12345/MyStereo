package edu.neu.cs5200.mystereo.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;


import edu.neu.cs5200.mystereo.models.PlayList2Music;

public class PlayList2MusicDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("MyStereo");
	EntityManager em = null;
	
	//CRUD
	//CREATE
	public List<PlayList2Music> createPlayList2Music(PlayList2Music playlist2music){
		List<PlayList2Music> playlist2musics = new ArrayList<PlayList2Music>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(playlist2music);
		Query query = em.createQuery("select playlist2music from PlayList2Music playlist2music");
		playlist2musics = (List<PlayList2Music>) query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return playlist2musics;
	}
	
	//READ
	public PlayList2Music findPlayList2Music(int playlist2musicId) {
		em = factory.createEntityManager();
		PlayList2Music playlist2music =null;
		
		playlist2music = em.find(PlayList2Music.class, playlist2musicId);

		em.close();
		return playlist2music;

	}
	
	//READALL
	public List<PlayList2Music> findAllPlayList2Musics() {
		List<PlayList2Music> playlist2musics = new ArrayList<PlayList2Music>();
		em = factory.createEntityManager();
		

		Query query = em.createQuery("select playlist2music from PlayList2Music playlist2music");
		playlist2musics = (List<PlayList2Music>) query.getResultList();


		em.close();
		return playlist2musics;
	}
	
	//UPDATE

	public List<PlayList2Music> updatePlayList2Music(int playlist2musicId, PlayList2Music playlist2music) {
		List<PlayList2Music> playlist2musics = new ArrayList<PlayList2Music>();
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		playlist2music.setId(playlist2musicId);
		em.merge(playlist2music);
		Query query = em.createQuery("select playlist2music from PlayList2Music playlist2music");
		playlist2musics = (List<PlayList2Music>) query.getResultList();

		em.getTransaction().commit();
		em.close();
		return playlist2musics;
	}
	
	//DELETE
	
	public List<PlayList2Music> removePlayList2Music(int playlist2musicId){
		List<PlayList2Music> playlist2musics = new ArrayList<PlayList2Music>();
		PlayList2Music playlist2music = null;
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		playlist2music = em.find(PlayList2Music.class, playlist2musicId);
		em.remove(playlist2music);
		
		Query query = em.createQuery("select playlist2music from PlayList2Music playlist2music");
		playlist2musics = (List<PlayList2Music>) query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		
		return playlist2musics;
	}

}
