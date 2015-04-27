package edu.neu.cs5200.mystereo.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import edu.neu.cs5200.mystereo.models.Album;

@Path("/album")
public class AlbumDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("MyStereo");
	EntityManager em = null;
	
	//CRUD
	@SuppressWarnings("unchecked")
	//CREATE
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public void createAlbum(Album album){
		em = factory.createEntityManager();
		em.getTransaction().begin();
		em.persist(album);
		em.getTransaction().commit();
		em.close();
	
	}
	
	
	//READ
	@GET
	@Path("/{ID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Album findAlbum(@PathParam("ID")int albumId) {
		em = factory.createEntityManager();
		Album album =null;
		album = em.find(Album.class, albumId);
		
		em.close();
		return album;

	}
	public Album findAlbumByMb(String Mbid) {
		List<Album> albums= new ArrayList<Album>();
		Album album=new Album();
		em = factory.createEntityManager();
	

		Query query = em.createQuery("select album from Album album where album.mbid=?1");
		query.setParameter(1,Mbid); 
		albums =(List<Album>)query.getResultList();
		for (Album a:albums)
		{
			album=a;
		}
		em.close();
		return album;
	}
	
	//READALL
	@GET
	@Path("/")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Album> findAllAlbums() {
		List<Album> albums = new ArrayList<Album>();
		em = factory.createEntityManager();
	

		Query query = em.createQuery("select album from Album album where mbid=?1");

		albums = (List<Album>) query.getResultList();


		em.close();
		return albums;
	}

	//UPDATE
	@PUT
	@Path("/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public void updateAlbum(@PathParam("id")Integer albumId, Album album) {

		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		album.setAlbumId(albumId);;
		em.merge(album);
		
		em.getTransaction().commit();
		em.close();
	}
	
	//DELETE
	@DELETE
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public void removeAlbum(@PathParam("id")int albumId){
		Album album = null;
		em = factory.createEntityManager();
		em.getTransaction().begin();
		album = em.find(Album.class, albumId);
		em.remove(album);
		em.getTransaction().commit();
		em.close();

	}



}
