package com.product.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
//import jakarta.transaction.Transactional;
import org.springframework.transaction.annotation.Transactional;

import com.product.entity.Notes;
import com.product.entity.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

//@Component
@Repository
public class UserDao {

	@PersistenceContext
	private EntityManager entityManager;

	public User login(String email, String password) {
		String hql = "FROM User WHERE email = :em AND password = :pwd";

		TypedQuery<User> query = entityManager.createQuery(hql, User.class);
		query.setParameter("em", email);
		query.setParameter("pwd", password);

		List<User> users = query.getResultList();
		return users.isEmpty() ? null : users.get(0);
	}

	// create.......
//	public void createUser(User user) {
//		entityManager.persist(user);
//	}
	
	@Transactional
	public int createUser(User user) {
	    entityManager.persist(user);
	    return user.getId();
	}

	// get Single......
	@Transactional(readOnly = true)
	public User getUser(int pId) {
		return entityManager.find(User.class, pId);
	}

	// get all.......
	@Transactional(readOnly = true)
	public List<User> getAllUser() {
		String jpql = "SELECT p FROM User p"; // JPQL query to select all products
		TypedQuery<User> query = entityManager.createQuery(jpql, User.class); // Create the query
		return query.getResultList(); // Execute the query and return the list of products
	}

	// delete....
	@Transactional
	public void deleteUser(int pId) {
		User p = entityManager.find(User.class, pId);
		if (p != null) {
			entityManager.remove(p);
		} else {
			throw new IllegalArgumentException("User with ID " + pId + " not found");
		}
	}
	
	
	
	/*................... Notes .................*/
	@Transactional
	public int saveNotes(Notes notes){
		entityManager.persist(notes);
		return notes.getId();
	}
	
//	@Transactional(readOnly = true)
//	public List<Notes> getNotesByUser(User user){
//		String sql = "form Notes where user=:us";
//		List<Notes> list = hibernateQuery.execute(s -> {
//			Query q = s.createQuery(sql);
//			q.setEntity("us", user);
//			return q.getResultList();
//		});
//		return list;
//	}
	
	@Transactional(readOnly = true)
    public List<Notes> getNotesByUser(User user) {
        String jpql = "SELECT n FROM Notes n WHERE n.user = :user";
        TypedQuery<Notes> query = entityManager.createQuery(jpql, Notes.class);
        query.setParameter("user", user);
        return query.getResultList();
    }
	
	@Transactional(readOnly = true)
	public Notes getNotesById(int id) {
		return entityManager.find(Notes.class, id);
	}
	
	@Transactional
	public void deleteNotes(int id) {
		Notes p = entityManager.find(Notes.class, id);
		if (p != null) {
			entityManager.remove(p);
		} else {
			throw new IllegalArgumentException("Notes with ID " + id + " not found");
		}
	}
	
	@Transactional
	public void updateNotes(Notes notes) {
		entityManager.merge(notes); 
	}

}
