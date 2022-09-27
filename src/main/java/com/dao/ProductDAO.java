package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Product;

public class ProductDAO {

	private SessionFactory factory;

	public ProductDAO(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public boolean saveProduct(Product product) {

		boolean isSavedProduct = false;

		try {
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();

			int saveProductId = (int) session.save(product);
			isSavedProduct = true;

			tx.commit();
			session.close();

		} catch (Exception e) {
			// TODO: handle exception
		}
		return isSavedProduct;
	}

	public List<Product> getAllProduct() {
		Session session = factory.openSession();
		String query = "from Product";
		Query q = session.createQuery(query);
		List<Product> list = q.list();

		return list;
	}

	public List<Product> getAllProductByCategoryId(int catId) {
		Session session = factory.openSession();
		String query = "from Product as p where p.category.categoryId=:id";
		Query q = session.createQuery(query);
		q.setParameter("id", catId);
		List<Product> list = q.list();
		return list;
	}
	
	public Long getProductsCount() {
		Session session = factory.openSession();
		String query = "select count(*) from Product";
		Query q = session.createQuery(query);
		
		Long productCounts =(Long) q.list().get(0);

		return productCounts;
	}
}
