package eco_house.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.apache.tomcat.util.codec.binary.Base64;

@Entity
public class Usuario {

	@Id
	private String email;
	
	private String nome, telefone, senha;
	
	@OneToOne(cascade=CascadeType.ALL)
	private Domicilio domicilio;
	
	@Lob
	private byte[] image;
	
	public Usuario() {
		
	}
	
	public Usuario(String email, String nome, String telefone, String senha, byte[] image) {
		this.email = email;
		this.nome = nome;
		this.telefone = telefone;
		this.senha = senha;
		this.image = image;
	}
	
	public String getNome() {
		return nome;
	}
	
	public String getSenha() {
		return senha;
	}
	
	public String getEmail() {
		return email;
	}

	public void setDomicilio(Domicilio domicilio) {
		this.domicilio = domicilio;
	}

	public Domicilio getDomicilio() {
		return domicilio;
	}
	
	public String getImage() {
		if (image == null) return null;
		
		return "data:image/png;base64," + Base64.encodeBase64String(image);
	}
}
