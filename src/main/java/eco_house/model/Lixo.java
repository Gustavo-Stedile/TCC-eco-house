package eco_house.model;

import java.time.LocalDate;
import java.time.Period;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Lixo {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="domicilio_id")
	private Domicilio domicilio;
	
	private LocalDate dataCadastro;
	
	private String tipo, nome;
	private int qtd;
	
	public Lixo() {

	}
	
	public Lixo(String tipo, String nome, LocalDate dataCadastro, int qtd) {
		this.dataCadastro = dataCadastro;
		this.tipo = tipo;
		this.nome = nome;
		this.qtd = qtd;
	}
	
	public int getId() {
		return id;
	}
	
	public String getTipo() {
		return tipo;
	}
	
	public int getQtd() {
		return qtd;
	}

	public void setQtd(int qtd) {
		this.qtd = qtd;
	}
	
	public int getDias() {
		Period periodo = Period.between(dataCadastro, LocalDate.now());
		return periodo.getDays() + periodo.getMonths() * 30 + periodo.getYears() * 365;
		
	}

	public LocalDate getDataCadastro() {
		return dataCadastro;
	}
	
	public String getNome() {
		return nome;
	}
}
