package eco_house.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class UsuarioDAO {

	
	public Usuario retrieve(String email) {
		Usuario usuario = null;
		EntityManager em = null;
		
		try {
			em = Hibernate.thisEntityManagerFactory.createEntityManager();
			usuario = em.find(Usuario.class, email);
		
		} catch (Exception e) {
			e.printStackTrace();
		
		} 
		return usuario;
	}
	
	public boolean save(Usuario u) {
		EntityManager em = null;
		
		try {
			em = Hibernate.thisEntityManagerFactory.createEntityManager();
			
			em.getTransaction().begin();
			em.persist(u);
			em.getTransaction().commit();
		
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		
		} 
		return true;
	}
	
	
	public boolean updateDomicilioFrom(String email, Domicilio d) {
		EntityManager em = null;
		
		try {
			em = Hibernate.thisEntityManagerFactory.createEntityManager();
			
			Usuario u = em.find(Usuario.class, email);
			if (u == null) return false;
			
			Domicilio oldD = em.find(Domicilio.class, u.getDomicilio().getId());
			
			em.getTransaction().begin();
			oldD.setBairro(d.getBairro());
			oldD.setCep(d.getCep());
			oldD.setCidade(d.getCidade());
			oldD.setNumero(d.getNumero());
			oldD.setRua(d.getRua());
			em.merge(oldD);
			em.getTransaction().commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		
		}
		return true;
	}
	
	public boolean addDomicilioInto(String email, Domicilio d) {
		EntityManager em = null;
		
		try {
			em = Hibernate.thisEntityManagerFactory.createEntityManager();
			
			Usuario u = em.find(Usuario.class, email);
			u.setDomicilio(d);
			
			em.getTransaction().begin();
			em.merge(u);
			em.getTransaction().commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		
		}
		
		return true;
	}
	
	public boolean addLixoInto(String email, Lixo l) {
		EntityManager em = null;
		
		try {
			em = Hibernate.thisEntityManagerFactory.createEntityManager();
			
			Usuario u = em.find(Usuario.class, email);
			if (u == null) return false;
			
			Domicilio d = em.find(Domicilio.class, u.getDomicilio().getId());
			d.getLixos().add(l);
			
			em.getTransaction().begin();
			em.merge(d);
			em.getTransaction().commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		
		}
		
		return true;	
	}
	
	public boolean removerLixoFrom(String email, int lixoId) {
		EntityManager em = null;
		
		try {
			em = Hibernate.thisEntityManagerFactory.createEntityManager();
			
			Usuario u = em.find(Usuario.class, email);
			if (u == null) return false;
			
			Domicilio d = em.find(Domicilio.class, u.getDomicilio().getId());
			Lixo l = em.find(Lixo.class, lixoId);
			
			em.getTransaction().begin();
			em.remove(l);
			d.getLixos().remove(l);
			em.getTransaction().commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean removeDomicilioFrom(String email) {
		EntityManager em = null;
		
		try {
			em = Hibernate.thisEntityManagerFactory.createEntityManager();
			
			Usuario u = em.find(Usuario.class, email);
			if (u == null) return false;
			
			Domicilio d = em.find(Domicilio.class, u.getDomicilio().getId());
			
			em.getTransaction().begin();
			u.setDomicilio(null);
			em.merge(u);
			em.remove(d);
			em.getTransaction().commit();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} 
		return true;
	}
}
