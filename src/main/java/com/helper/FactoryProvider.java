package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	private static SessionFactory factory;

	public static SessionFactory getSessionFactory() {
		try {
			if (factory == null) {
				
				//creating new factory ob
				/*
				 * factory = new
				 * Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
				 */
				
				Configuration cfg = new Configuration();
				Configuration configure = cfg.configure();
				  factory = configure.buildSessionFactory();
				System.out.println("creating new factory object"+ factory);
			} 
		} catch (Exception e) {
			// TODO: handle exception
		}

		System.out.println("already factory object created"+factory);
		return factory;
	}
}
