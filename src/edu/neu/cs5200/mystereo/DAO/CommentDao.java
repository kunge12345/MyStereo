package edu.neu.cs5200.mystereo.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.mystereo.models.Comment;
import edu.neu.cs5200.mystereo.models.Music;
import edu.neu.cs5200.mystereo.models.User;

public class CommentDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("MyStereo");
	EntityManager em = null;

	// CRUD
	// CREATE
	public void createComment(Comment comment) {
		em = factory.createEntityManager();
		List<Comment> comments = new ArrayList<Comment>();
		em.getTransaction().begin();

		em.persist(comment);
		em.getTransaction().commit();
		Query query = em.createQuery("select comment from Comment comment");

		comments = (List<Comment>) query.getResultList();
		em.close();
	}

	// READ

	public Comment findComment(int commentId) {
		em = factory.createEntityManager();
		Comment comment = null;

		comment = em.find(Comment.class, commentId);
		em.close();
		return comment;

	}

	// READALL

	public List<Comment> findAllComments() {
		List<Comment> comments = new ArrayList<Comment>();
		em = factory.createEntityManager();

		Query query = em.createQuery("select comment from Comment comment");
		comments = (List<Comment>) query.getResultList();

		em.close();
		return comments;
	}

	// UPDATE
	public List<Comment> updateComment(int commentId, Comment comment) {
		List<Comment> comments = new ArrayList<Comment>();
		em = factory.createEntityManager();
		em.getTransaction().begin();

		comment.setId(commentId);
		em.merge(comment);
		Query query = em.createQuery("select comment from Comment comment");
		comments = (List<Comment>) query.getResultList();

		em.getTransaction().commit();
		em.close();
		return comments;
	}

	// DELETE

	public List<Comment> removeComment(int commentId) {
		List<Comment> comments = new ArrayList<Comment>();
		Comment comment = null;
		em = factory.createEntityManager();
		em.getTransaction().begin();

		comment = em.find(Comment.class, commentId);
		em.remove(comment);

		Query query = em.createQuery("select comment from Comment comment");
		comments = (List<Comment>) query.getResultList();

		em.getTransaction().commit();
		em.close();

		return comments;
	}
	
	public static void main(String[] args){
		CommentDao cdao = new CommentDao();
		MusicDao mdao = new MusicDao();
		Music music = mdao.findMusic(39);
		/*UserDao udao = new UserDao();
		User user = udao.findUser(3);
		Comment comment = new Comment(null, null, "haha", user, music);
		cdao.createComment(comment);
		List<Comment> comments = cdao.findAllComments();
		for (Comment cmt : comments){
			System.out.println(cmt.getContent());
		}*/
		System.out.println(music.getComments().get(0).getContent());
	}

}
