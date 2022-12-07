package eco_house.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

public class EcopontoDAO {
	
	private EntityManager em;
	
	public EcopontoDAO() {
		em = Hibernate.thisEntityManagerFactory.createEntityManager();
	}
	
	public List<Ecoponto> retrieve() {
		List<Ecoponto> ecopontos = new ArrayList<>();
		
		try {
			ecopontos = em.createQuery("FROM Ecoponto").getResultList();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ecopontos;
	}
	
	public boolean insert(Ecoponto eco) {
		try {
			em.getTransaction().begin();
			em.persist(eco);
			em.getTransaction().commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
		
}
