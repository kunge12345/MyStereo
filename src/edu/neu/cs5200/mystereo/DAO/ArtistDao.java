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

import edu.neu.cs5200.mystereo.models.Artist;
import edu.neu.cs5200.mystereo.models.Artist;

@Path("/artist")
public class ArtistDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("MyStereo");
	EntityManager em = null;
	
	//CRUD
	@SuppressWarnings("unchecked")
	//CREATE
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public void createArtist(Artist artist){

		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(artist);

		
		em.getTransaction().commit();
		em.close();
	}
	
	//READ
	@GET
	@Path("/{ID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Artist findArtist(@PathParam("ID")int artistId) {
		em = factory.createEntityManager();
		Artist artist =null;
	
		artist = em.find(Artist.class, artistId);
	
		em.close();
		return artist;

	}
	public Artist findArtistByMb(String Mbid) {
		List<Artist> artists=new ArrayList<Artist>();
		Artist artist=new Artist();
		em = factory.createEntityManager();
	

		Query query = em.createQuery("select artist from Artist artist where artist.mbid=?1");
		query.setParameter(1,Mbid); 
		artists =(List<Artist>)query.getResultList();
		for(Artist a:artists)
		{
			artist=a;
		}
		


		em.close();
		return artist;
	}
	//READALL
	@GET
	@Path("/")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Artist> findAllArtists() {
		List<Artist> artists = new ArrayList<Artist>();
		em = factory.createEntityManager();
	

		Query query = em.createQuery("select artist from Artist artist");
		artists = (List<Artist>) query.getResultList();


		em.close();
		return artists;
	}
	
	//UPDATE
	@PUT
	@Path("/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public void updateArtist(@PathParam("id")Integer artistId, Artist artist) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		artist.setArtistId(artistId);
		em.merge(artist);
		em.getTransaction().commit();
		em.close();
	}
	
	//DELETE
	@DELETE
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public void removeArtist(@PathParam("id")int artistId){
		Artist artist = null;
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		artist = em.find(Artist.class, artistId);
		em.remove(artist);
		em.getTransaction().commit();
		em.close();
	}
       public static void main(String[] args)
{
	String atstr="bfcc6d75-a6a5-4bc6-8282-47aec8531818";
  ArtistDao dao= new ArtistDao();
  Artist art=new Artist();
 art=dao.findArtistByMb(atstr);
  
}
}
