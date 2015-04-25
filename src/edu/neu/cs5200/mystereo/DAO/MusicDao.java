package edu.neu.cs5200.mystereo.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

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
	public List<Music> createMusic(Music music){
		List<Music> musics = new ArrayList<Music>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(music);
		Query query = em.createQuery("select music from Music music");
		musics = (List<Music>) query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return musics;
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
	public List<Music> updateMusic(@PathParam("id")int musicId, Music music) {
		List<Music> musics = new ArrayList<Music>();
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		music.setMsid(musicId);
		em.merge(music);
		Query query = em.createQuery("select music from Music music");
		musics = (List<Music>) query.getResultList();

		em.getTransaction().commit();
		em.close();
		return musics;
	}
	
	//DELETE
	@DELETE
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Music> removeMusic(@PathParam("id")int musicId){
		List<Music> musics = new ArrayList<Music>();
		Music music = null;
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		music = em.find(Music.class, musicId);
		em.remove(music);
		
		Query query = em.createQuery("select music from Music music");
		musics = (List<Music>) query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		
		return musics;
	}
/*	public static void main(String[] args){
		MusicDao dao = new MusicDao();
		Music music = dao.findMusic(1);
		System.out.println(music.getName());
		
	}*/

}
