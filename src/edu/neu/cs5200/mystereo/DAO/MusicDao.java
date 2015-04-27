package edu.neu.cs5200.mystereo.DAO;

import java.util.*;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import edu.neu.cs5200.mystereo.models.Music;
import edu.neu.cs5200.mystereo.models.Music;



@Path("/music")
public class MusicDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("MyStereo");
	EntityManager em = null;
	
	//CRUD
	@SuppressWarnings("unchecked")
	//CREATE
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public void createMusic(Music music){
		

		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(music);

		
		em.getTransaction().commit();
		em.close();
	
	}
	
	//READ
	@GET
	@Path("/{ID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Music findMusic(@PathParam("ID")int musicId) {
		em = factory.createEntityManager();
		Music music =null;
		
		music = em.find(Music.class, musicId);

		em.close();
		return music;

	}
	public Music findMusicByMB(String name) {
		Music music=new Music();
		List<Music> musics=new ArrayList<Music>();

		em = factory.createEntityManager();
	    Query query = em.createQuery("select music from Music music where music.mbid=?1");
		query.setParameter(1, name);
	    musics = (List<Music>) query.getResultList();
		for (Music m:musics)
		{music=m;
		}


		em.close();
		return music;
	}
	//READALL
	@GET
	@Path("/")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Music> findAllMusics() {
		List<Music> musics = new ArrayList<Music>();
		em = factory.createEntityManager();


		Query query = em.createQuery("select music from Music music");
		musics = (List<Music>) query.getResultList();


		em.close();
		return musics;
	}
	
	//UPDATE
	@PUT
	@Path("/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public void updateMusic(@PathParam("id")Integer  musicId, Music music) {
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		music.setMsid(musicId);
		em.merge(music);
		em.getTransaction().commit();
		em.close();
	}
	
	//DELETE
	@DELETE
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public void removeMusic(@PathParam("id")int musicId){
		Music music = null;
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		music = em.find(Music.class, musicId);
		em.remove(music);
		
		em.getTransaction().commit();
		em.close();
		

	}
/*	public static void main(String[] args){
		MusicDao dao = new MusicDao();
		Music music = dao.findMusic(1);
		System.out.println(music.getName());
		
	}*/

}
