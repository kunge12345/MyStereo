package edu.neu.cs5200.mystereo.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.mystereo.models.Music;
import edu.neu.cs5200.mystereo.models.PlayList;
import edu.neu.cs5200.mystereo.models.PlayList2Music;

public class PlayList2MusicDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("MyStereo");
	EntityManager em = null;
	
	//CRUD
	//CREATE
	public void createPlayList2Music(PlayList2Music playlist2music){
		List<PlayList2Music> playlist2musics = new ArrayList<PlayList2Music>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(playlist2music);
	
		
		em.getTransaction().commit();
		em.close();
		
	}
	
	//READ
	public PlayList2Music findPlayList2Music(int playlist2musicId) {
		em = factory.createEntityManager();
		PlayList2Music playlist2music =null;
		
		playlist2music = em.find(PlayList2Music.class, playlist2musicId);

		em.close();
		return playlist2music;

	}
	
	
	
	
	
	
	
	
	
	
	public List<PlayList2Music> findMusicbyPid(Integer Pid){
		List<PlayList2Music> p =new ArrayList<PlayList2Music>();
		List<PlayList2Music> p2=new ArrayList<PlayList2Music>();
		em=factory.createEntityManager();
		Query query=em.createQuery("select playlist2music from PlayList2Music playlist2music");
		p=(List<PlayList2Music>) query.getResultList();
		for(PlayList2Music p2m: p)
		{
			if(p2m.getPlaylist().getpId()==Pid)
			p2.add(p2m);
		}
		em.close();
		return p2;
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

	public void updatePlayList2Music(Integer playlist2musicId, PlayList2Music playlist2music) {
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		playlist2music.setId(playlist2musicId);
		em.merge(playlist2music);
		em.getTransaction().commit();
		em.close();
	}
	
	//DELETE
	
	public void removePlayList2Music(int playlist2musicId){
		
		PlayList2Music playlist2music = null;
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		playlist2music = em.find(PlayList2Music.class, playlist2musicId);
		em.remove(playlist2music);
		
	
		
		em.getTransaction().commit();
		em.close();
		
		
	}

}
