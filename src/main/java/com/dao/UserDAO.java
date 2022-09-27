package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.User;

public class UserDAO {

	private SessionFactory factory;

	public UserDAO(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	// getting user by email and password

	public User getUserByEmail(String email) {
		User user = null;

		try {

			String query = "from User where userEmail =: e";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			user = (User) q.uniqueResult();

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;

	}

	public Long getUsersCount() {
		Session session = factory.openSession();
		String query = "select count(*) from User";
		Query q = session.createQuery(query);
		
		Long userCounts =(Long) q.list().get(0);

		return userCounts;
	}
}
