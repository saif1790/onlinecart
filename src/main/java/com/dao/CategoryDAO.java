package com.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Category;

public class CategoryDAO {

	private SessionFactory factory;

	public CategoryDAO(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public int saveCategory(Category category) {
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();

		int catId = (int) session.save(category);

		tx.commit();
		session.close();
		return catId;
	}

	public List<Category> getCategories() {
		Session session = factory.openSession();
		String query = "from Category";

		Query q = session.createQuery(query);
		List<Category> list = q.list();

		return list;
	}

	public Category getCategoryByCategoryId(int catId) {
		Session session = factory.openSession();

		Category category = session.get(Category.class, catId);
		category.getCategoryTitle();
		category.getCategoryDescription();

		session.close();
		return category;

		
	}
}
