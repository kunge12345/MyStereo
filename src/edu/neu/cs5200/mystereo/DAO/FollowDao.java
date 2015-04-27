package edu.neu.cs5200.mystereo.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.mystereo.models.*;


public class FollowDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("MyStereo");
	EntityManager em = null;
	
	//CRUD
	//CREATE
	public void createFollow(Follow follow){
		List<Follow> follows = new ArrayList<Follow>();

		em = factory.createEntityManager();
		em.getTransaction().begin();

		em.persist(follow);
	
		
		em.getTransaction().commit();
		em.close();
		
	}
	
	//READ
	public Follow findFollow(int followId) {
		em = factory.createEntityManager();
		Follow follow =null;
		
		follow = em.find(Follow.class, followId);

		em.close();
		return follow;

	}
	
	
	
	
	
	
	
	
	
	
	public List<Follow> findFollowbyuid(Integer id){
		List<Follow> p =new ArrayList<Follow>();
		List<Follow> p2=new ArrayList<Follow>();
		em=factory.createEntityManager();
		Query query=em.createQuery("select f from Follow f");
		p=(List<Follow>) query.getResultList();
		for(Follow p2m: p)
		{
			if(p2m.getFollowed().getuId()==id)
			p2.add(p2m);
		}
		em.close();
		return p2;
	}
	
	public List<Follow> findFollowedbyuid(Integer id){
		List<Follow> p =new ArrayList<Follow>();
		List<Follow> p2=new ArrayList<Follow>();
		em=factory.createEntityManager();
		Query query=em.createQuery("select f from Follow f");
		p=(List<Follow>) query.getResultList();
		for(Follow p2m: p)
		{
			if(p2m.getFollow().getuId()==id)
			p2.add(p2m);
		}
		em.close();
		return p2;
	}
	//READALL
	public List<Follow> findAllFollows() {
		List<Follow> follows = new ArrayList<Follow>();
		em = factory.createEntityManager();
		

		Query query = em.createQuery("select f from Follow f");
		follows = (List<Follow>) query.getResultList();


		em.close();
		return follows;
	}
	
	//UPDATE

	public void updateFollow(Integer followId, Follow follow) {
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		follow.setFid(followId);
		em.merge(follow);
		em.getTransaction().commit();
		em.close();
	}
	
	//DELETE
	
	public List<Follow> removeFollow(int followId){
		List<Follow> follows = new ArrayList<Follow>();
		Follow follow = null;
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		follow = em.find(Follow.class, followId);
		em.remove(follow);
		
		Query query = em.createQuery("select f from Follow f");
		follows = (List<Follow>) query.getResultList();
		
		em.getTransaction().commit();
		em.close();
		
		return follows;
	}
}
