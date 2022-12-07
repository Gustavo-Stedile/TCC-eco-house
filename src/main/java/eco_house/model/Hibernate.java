package eco_house.model;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Hibernate {
	public static EntityManagerFactory thisEntityManagerFactory = Persistence.createEntityManagerFactory("eco-house");
}
